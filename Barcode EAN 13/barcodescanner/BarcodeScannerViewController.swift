//
//  BarcodeScannerViewController.swift
//  Barcode EAN 13
//
//  Created by Bui Van Tuan on 7/18/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit

class BarcodeScannerViewController: UIViewController {

    @IBOutlet weak var scanbutton: UIButton!
    @IBOutlet weak var barcodeView: BarcodeScanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func startScanner(_ sender: Any) {
        barcodeView.result = true
        barcodeView.captureSession.startRunning()
        self.view.addSubview(barcodeView)
    }
    
}
