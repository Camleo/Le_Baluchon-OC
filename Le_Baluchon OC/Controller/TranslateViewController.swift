//
//  TranslateViewController.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 24.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit

enum Language: String {
    case fr
    case en
}

class TranslateViewController: UIViewController {
    
    
    @IBOutlet weak var toTranslateView: UITextView!
    @IBOutlet weak var resultTranslation: UILabel!
    @IBOutlet weak var frLanguage: UILabel!
    @IBOutlet weak var enLanguage: UILabel!
    @IBOutlet weak var swapLanguage: UIButton!
    @IBOutlet weak var translatButton: UIButton!
    
   
    var text: String = ""
    let googleService = GoogleService()
    private var sourceLanguage: Language = .fr
    
    // Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    // MARK: - Text Field
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        toTranslateView.text = ""
//    }
    
    @IBAction func switchLanguage(_ sender: UIButton) {
        toTranslateView.resignFirstResponder()
        sender.rotateIt()
        (frLanguage.text, enLanguage.text) = (enLanguage.text, frLanguage.text)
        sourceLanguage = (sourceLanguage == .fr) ? .en : .fr
    }
    
    @IBAction func transleButton(_ sender: UIButton) {
        toTranslateView.resignFirstResponder()
        guard let text = toTranslateView.text, !text.isEmpty else { return }
        googleService.getTranslation(text: text) { [ unowned self] result  in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    print(self.toTranslateView.text!)
                    print("data controller = \(data)")
                    self.resultTranslation.text = data
                }
            case.failure(let error):
                print (error)
            }
        }
        
    }
}




//        guard let url = URL(string: "https://translation.googleapis.com/language/translate/v2?") else { return }
//        services.request(baseUrl: url, parameters: [("key, source, target, format, q", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA, fr, en, text, Bonjour")]) { [unowned self]  (result: Result<String, NetWorkError>) in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    //self.sourceLanguage = Language(rawValue: data)!
//                    print(self.toTranslateView.text!)
//                    print("data controller = \(data)")
//                    self.resultTranslation.text = data
//
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

