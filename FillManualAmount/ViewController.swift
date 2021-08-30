//
//  ViewController.swift
//  FillManualAmount
//
//  Created by 홍서진 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    let max = 10000
    
    @IBOutlet weak var tfAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfAmount.addTarget(self, action: #selector(fieldDidchanged), for: .editingChanged)
    }

    
    @objc func fieldDidchanged(_ textField:UITextField) {
        if let amountString = textField.text?.replacingOccurrences(of: ",", with: "") {
            
            let max = Int(max)
            if Int(amountString) ?? 0 > max {
                textField.text = max.currency
                // 금액 0원은 입력 제한
            } else if Int(amountString) ?? 0 == 0{
                textField.text = ""
            } else {
                textField.text = amountString.currency
            }
        }
    }
}

extension Int {
    var currency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: self))?.currency ?? "0"
    }
}

extension String {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let currencyString = formatter.string(from: formatter.number(from: self) ?? 0) ?? "0"
        //        currencyString = currencyString + "원"
        
        return currencyString
    }
}
