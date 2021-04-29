import UIKit

class LoginViewController: UIViewController {
    private let customView = LoginView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.overrideUserInterfaceStyle = .dark
        bind()
    }
    
    private func bind() {
        let target = self
        let loginModel = LoginModel()
        customView.didTapOk = { [weak self] credential in
            if self?.customView.emailTextField.text == "" || self?.customView.passwordTextField.text == "" {
                ShowAlertManager.showAlert(title: TextModel.error.rawValue, message: TextModel.camposInvalid.rawValue, target: target)
                self?.customView.loginError()
            } else if self?.customView.emailTextField.text != loginModel.email || self?.customView.passwordTextField.text != loginModel.password {
                ShowAlertManager.showAlert(title: TextModel.loginInvalid.rawValue, message: TextModel.emailAndPasswordInvalid.rawValue, target: target)
                self?.customView.loginError()
            } else {
                self?.makeController()
            }
        }
    }
    
    private func makeController() {
        let storyboard = UIStoryboard(name: TextModel.main.rawValue, bundle: nil)
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: TextModel.home.rawValue) as? HomeViewController else {return}
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true)
    }
}
