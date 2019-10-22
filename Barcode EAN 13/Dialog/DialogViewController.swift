//
//  NotificationViewController.swift
//  Barcode EAN 13
//
//  Created by Bui Van Tuan on 7/17/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit
import EAN13BarcodeGenerator

class DialogViewController: UIViewController {
    
    @IBOutlet  weak var dialogBarcode: DialogView!
    var dialog = DialogView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()

    }
    
    private func setupNotification() {
      NotificationCenter.default.addObserver(self, selector: #selector(showDialogCode), name: .action, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(dialogFailed), name: .showAlert, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(true)
    }
    @objc func showDialogCode(data: Notification) {
            self.view.addSubview(self.dialogBarcode)
            self.dialogBarcode.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            self.view.layoutIfNeeded()
    }
    @objc func dialogFailed() {
       showDialog()
    }
    
}
extension DialogViewController {
    func showDialog(){
        let alert = UIAlertController(title: "タイトル", message: "本画面は、精算前にスキャンしてくださスキャンい場合はインターネットボタンを押し番号を手入力してください", preferredStyle: .alert)
        alert.view.layer.borderColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9124839469)
        alert.view.layer.cornerRadius = 5
        alert.view.layer.borderWidth  = 5
        alert.view.layer.opacity      = 0.5
        alert.addAction(UIAlertAction(title: "次 の", style: .default, handler: { (data) in
            NotificationCenter.default.post(name: .action, object: nil, userInfo: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
