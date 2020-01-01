//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by David Chea on 01/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var frenchTextField: UITextView!
    @IBOutlet weak var englishTextField: UITextView!
    
    // MARK: - Method
    
    private func updateEnglishTextField(translatedText: String, error: String) {
        guard error == "" else {
            presentErrorAlert(message: error)
            return
        }
        
        englishTextField.text = translatedText
    }
}

extension TranslationViewController: UITextViewDelegate {
    
    // MARK: - Delegate method
    
    func textViewDidChange(_ textView: UITextView) {
        CloudTranslationAPI.shared.getTranslationToEnglish(textView.text, completionHandler: updateEnglishTextField(translatedText:error:))
    }
}
