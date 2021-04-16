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
        customView.didTapOk = { [weak self] credential in
//            let email: String = "teste@movies.com.br"
            let email: String = "teste"
            let password: String = "1234"
            
            if self?.customView.emailTextField.text == "" || self?.customView.passwordTextField.text == "" {
                self?.showAlert(message: "Campos Inválidos.")
                self?.customView.loginError()
            } else if self?.customView.emailTextField.text != email || self?.customView.passwordTextField.text != password {
                self?.showAlert(message: "Login inválido! Email ou Senha incorretos.")
            } else {
                print("ENTREI")
                //            makecontroller()
            }
        }
    }
    
//    private func makeController() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController else {return}
//        homeViewController.user = user
//        homeViewController.requestConfig = session
//        homeViewController.modalPresentationStyle = .fullScreen
//        self.present(homeViewController, animated: true)
//    }

}
