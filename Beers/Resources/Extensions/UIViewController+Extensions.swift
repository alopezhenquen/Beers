//
//  UIViewController+Extensions.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 24/1/21.
//

import UIKit

extension UIViewController {
    func showErrorAlert(with error: Error){
        let errorAlert = UIAlertController.init(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert)
        errorAlert.present(self, animated: true, completion: nil)
    }
}
