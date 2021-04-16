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
    
    private func bind() {
        let target = self
        customView.didTapOk = { [weak self] credential in
//            let email: String = "teste@movies.com.br"
            let email: String = "teste"
            let password: String = "1234"
            if self?.customView.emailTextField.text == "" || self?.customView.passwordTextField.text == "" {
                ShowAlertManager.showAlert(title: "Erro", message: "Campos Inválidos.", target: target)
                self?.customView.loginError()
            } else if self?.customView.emailTextField.text != email || self?.customView.passwordTextField.text != password {
                ShowAlertManager.showAlert(title: "Login Inválido", message: "Email ou Senha incorretos.", target: target)
            } else {
                self?.makeController()
            }
        }
    }
    
    private func makeController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController else {return}
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true)
    }
}
