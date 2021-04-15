//
//  LoginViewController.swift
//  ProjectMovies
//
//  Created by Maria Clara Lopes on 14/04/21.
//

import UIKit

class LoginViewController: UIViewController {
    let customView = LoginView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func showAlert(message: String) {
        let alert = UIAlertController.init(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func bind() {
        customView.didTapOk = { [weak self] button in
            print("ENTREI")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController else {return}
        //        homeViewController.modalPresentationStyle = .fullScreen
        //        self.present(homeViewController, animated: true)
        }
    }
}
