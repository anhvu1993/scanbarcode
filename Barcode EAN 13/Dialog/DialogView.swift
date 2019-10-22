//
//  DialogView.swift
//  Barcode EAN 13
//
//  Created by Bui Van Tuan on 7/17/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftGifOrigin
import EAN13BarcodeGenerator

class DialogView: UIView {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var showbutton: UIButton!
    @IBOutlet weak var barCodeview: BarCodeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myView.addSubview(barCodeview)
        self.barCodeview.barCode = GetNewRandomEAN13BarCode()
        self.showbutton.layer.borderColor  = UIColor.red.cgColor
        self.showbutton.layer.cornerRadius = 10
        self.showbutton.layer.borderWidth  = 1
        self.myView.layer.cornerRadius     = 7
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.removeFromSuperview()
        NotificationCenter.default.post(name: .showAlert, object: nil, userInfo: nil)
    }
    
}

