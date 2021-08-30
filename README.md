# FillManualAmount

![image](https://github.com/comcxx11/FillManualAmount/blob/main/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-08-30%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2011.03.09.png)

```swift
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

```
