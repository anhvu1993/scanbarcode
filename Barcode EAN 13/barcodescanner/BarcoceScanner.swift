//
//  BarcoceScanner.swift
//  Barcode EAN 13
//
//  Created by Bui Van Tuan on 7/18/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import AVFoundation
import UIKit

class BarcodeScanner: UIView, AVCaptureMetadataOutputObjectsDelegate{
    var videoInput: AVCaptureDeviceInput!
    var captureSession: AVCaptureSession!
    var preViewlayer: AVCaptureVideoPreviewLayer!
 
    var result: Bool = true {
        didSet {
            captureSession = AVCaptureSession()
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { print("NO Camera")
                return}
            do {
                videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice)
            }catch {
                return
            }
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }else {
                failed(ViewController())
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.ean13, .code128, .code39, .code93, .ean8, .qr, .itf14, .upce]
            }else {
                failed(BarcodeScannerViewController())
                return
            }
            preViewlayer = AVCaptureVideoPreviewLayer(session: captureSession)
            preViewlayer.frame = self.layer.bounds
            preViewlayer.videoGravity = .resizeAspectFill
            layer.addSublayer(preViewlayer)
            
            captureSession.startRunning()
            
            func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
                captureSession.stopRunning()
                if let metadataObject = metadataObjects.first {
                    guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                    guard let stringValue = readableObject.stringValue else { return }
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    found(code: stringValue)
                }
                
        }
            func found(code: String) {
                print(code)
                
                if !code.isEmpty{
                print(code)
                }
                if let previewLayer = preViewlayer{
                    previewLayer.removeFromSuperlayer()
                }
            }
            var prefersStatusBarHidden: Bool {
                return true
            }
            
            var supportedInterfaceOrientations: UIInterfaceOrientationMask {
                return .portrait
            }
        
        }
    }
    }


extension BarcodeScanner {
    func failed(_ vc: UIViewController) {
        let showAlert = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default))
       vc.present(showAlert, animated: true)
        captureSession = nil
    }
}
