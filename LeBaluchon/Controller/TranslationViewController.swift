//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by David Chea on 01/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import UIKit
import SwiftyJSON

class TranslationViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var frenchTextField: UITextView!
    @IBOutlet weak var englishTextField: UITextView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizer()
    }
    
    // MARK: - Method
    
    private func updateEnglishTextField(_ json: JSON) {
        guard json["error"] == JSON.null else {
            presentErrorAlert(message: json["error"].stringValue)
            return
        }
        
        let translatedText = json["data"]["translations"][0]["translatedText"].stringValue
        englishTextField.text = translatedText
    }
}

extension TranslationViewController: UITextViewDelegate {
    
    // MARK: - Delegate method
    
    func textViewDidChange(_ textView: UITextView) {
        CloudTranslationAPI.shared.getTranslationToEnglish(textView.text, completionHandler: updateEnglishTextField(_:))
    }
}
