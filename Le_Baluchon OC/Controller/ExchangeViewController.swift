//
//  ExchangeViewController.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 24.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    var imageView: UIImageView = {
           let imageView = UIImageView(frame: .zero)
           imageView.image = UIImage(named: "eurousd")
           imageView.contentMode = .scaleToFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var baseCurrecyLabel: UILabel!
    @IBOutlet weak var targetCurrencyLabel: UILabel!
    
    let fixerService = FixerService()
    var total: Double = 0.00
    var totalString : String {
        return String(format: "%.0f", total)
    }
    
    var rate: Double = 0.00
    var solution: Double = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    @IBAction func convertButton(_ sender: UIButton) {
        currencyTextField.resignFirstResponder()
        fixerService.getExchangeRate {[ unowned self] result  in
            switch result {
            case.success(let rate):
                DispatchQueue.main.async {
                    self.rate = rate
                    
                    guard let result = self.updateDisplay(self.total, self.rate) else { return }
                                       var totalString: String {
                                           return String(format: "%.3f", result)
                                       }
                                       self.resultLabel.text = "\(totalString) "
                                       self.currencyTextField.text = ""
                }
            case.failure(let error):
                print (error)
            }
        }
//        guard let url = URL(string: "http://data.fixer.io/api/latest?") else { return }
//        services.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { [unowned self]  (result: Result<Currency, NetWorkError>) in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    self.rate = data.rates["USD"]!
//                    print(self.rate)
//
//                    guard let result = self.updateDisplay(self.total, self.rate) else { return }
//                    var totalString: String {
//                        return String(format: "%.3f", result)
//                    }
//                    self.resultLabel.text = "\(totalString) "
//                    self.currencyTextField.text = ""
//                }
//            case .failure(let error):
//                print(error)
//
//            }
//        }
    }
    
    
    // Dismiss the keyboard when touching somewhere in the sreen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
extension ExchangeViewController {
    private func convertReply() -> Double {
        guard let currencyString = currencyTextField.text else { return 0 }
        guard let DoubleString = Int(currencyString) else {return 0 }
        print(Double(DoubleString))
        let sum = Double(DoubleString)
        return sum
    }
    
    private func updateDisplay(_ sum: Double, _ rate: Double) -> Double? {
        let sumUser = convertReply()
        self.total = sumUser
        solution = rate * sumUser
        print("\(sumUser) EUR = \(solution) USD")
        return solution
        
    }
}
