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
        let loginModel = LoginModel()
        customView.didTapOk = { [weak self] credential in
            if self?.customView.emailTextField.text == "" || self?.customView.passwordTextField.text == "" {
                ShowAlertManager.showAlert(title: "Erro", message: "Campos Inválidos.", target: target)
                self?.customView.loginError()
            } else if self?.customView.emailTextField.text != loginModel.email || self?.customView.passwordTextField.text != loginModel.password {
                ShowAlertManager.showAlert(title: "Login Inválido", message: "Email ou Senha incorretos.", target: target)
                self?.customView.loginError()
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
