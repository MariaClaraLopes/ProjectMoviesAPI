//
//  LoginAlert.swift
//  ProjectMovies
//
//  Created by Maria Clara Lopes on 16/04/21.
//

// TODO: Quando der, aprender a usar localizable strings
// https://betterprogramming.pub/localized-strings-using-swiftgen-55422974eb44

import UIKit

class ShowAlertManager {
    static func showAlert(title: String, message: String, target: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        target.present(alert, animated: true)
    }
}

