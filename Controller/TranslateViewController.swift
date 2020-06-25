//
//  TranslateViewController.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 24.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController {
    
    
    @IBOutlet weak var toTranslateView: UITextView!
    @IBOutlet weak var resultTranslation: UILabel!
    @IBOutlet weak var frLanguage: UILabel!
    @IBOutlet weak var enLanguage: UILabel!
    @IBOutlet weak var swapLanguage: UIButton!
    @IBOutlet weak var translatButton: UIButton!
    
    
    private let services: Services = Services()
    
    var param = [String: String]()
    private var sourceLanguage: Language = .fr
    
    // Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func switchLanguage(_ sender: UIButton) {
        toTranslateView.resignFirstResponder()
        sender.rotateIt()
        (frLanguage.text, enLanguage.text) = (enLanguage.text, frLanguage.text)
        sourceLanguage = (sourceLanguage == .fr) ? .en : .fr
    }
    
    @IBAction func transleButton(_ sender: UIButton) {
        toTranslateView.resignFirstResponder()
        guard let url = URL(string: "https://translation.googleapis.com/language/translate/v2") else { return }
        services.request(baseUrl: url, parameters: [("ApiKey", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA")]) { [unowned self]  (result: Result<String, NetWorkError>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.sourceLanguage = Language(rawValue: data)!
                    print(self.param)
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

