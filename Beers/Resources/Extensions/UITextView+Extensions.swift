//
//  UITextView+Extensions.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 29/1/21.
//

import UIKit

extension UITextView {
    
    func setTextAndAccessibilityValue(with value: String) {
        self.text = value
        self.accessibilityValue = value
    }
}
