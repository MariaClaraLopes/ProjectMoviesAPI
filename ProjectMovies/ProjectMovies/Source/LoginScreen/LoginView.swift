//
//  LoginView.swift
//  ProjectMovies
//
//  Created by Maria Clara Lopes on 14/04/21.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    var didTapOk: (((email: String, password: String)) -> Void)?

    let logoContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "LogoLogin")
        return image
    }()
        
    let loginContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let emailLabelContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        return label
    }()
    
    let emailContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        view.layer.cornerRadius = 4
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        textField.keyboardType = .emailAddress
        textField.placeholder = "teste@movies.com.br"
        textField.addTarget(self, action:#selector(emailChangeColorClickedTextField), for: .touchUpInside)
        return textField
    }()
    
    let emailImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "envelope")
        image.tintColor = .black
        return image
    }()
    
    let passwordLabelContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        return label
    }()
    
    let passwordContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        view.layer.cornerRadius = 4
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        textField.keyboardType = .numbersAndPunctuation
        textField.placeholder = "1234"
        textField.attributedText = .init(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPink])
        textField.addTarget(self, action:#selector(passwordChangeColorClickedTextField), for: .touchUpInside)
        return textField
    }()
    
    let passwordImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "lock")
        image.tintColor = .black
        return image
    }()
    
    let passwordHideButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "eye.fill")
        button.tintColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        button.setImage(image, for: .normal)
        button.addTarget(self, action:#selector(buttonHideClicked), for: .touchUpInside)
        return button
    }()
    
    let buttonEnterContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        return view
    }()
    
    let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ENTRAR", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        button.addTarget(self, action:#selector(buttonEnterClicked), for: .touchUpInside)
        return button
    }()
    
    let imageErrorEmail: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "x.circle.fill")
        image.tintColor = UIColor(red: 0.878, green: 0, blue: 0, alpha: 1)
        return image
    }()
    
    let imageErrorPassword: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "x.circle.fill")
        image.tintColor = UIColor(red: 0.878, green: 0, blue: 0, alpha: 1)
        return image
    }()
    
    let labelError: UILabel = {
        let label = UILabel()
        label.text = "Credenciais Incorretas"
        label.textColor = UIColor(red: 0.878, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Rubik-Light", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonHideClicked() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            let image = UIImage(systemName: "eye.slash.fill")
            passwordHideButton.setImage(image, for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            let image = UIImage(systemName: "eye.fill")
            passwordHideButton.setImage(image, for: .normal)
        }
    }
    
    @objc func buttonEnterClicked(sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        didTapOk?((email: email, password: password))
    }
    
    func setupView() {
        setupTap()
        
        imageErrorEmail.isHidden = true
        imageErrorPassword.isHidden = true
        labelError.isHidden = true

        self.addSubview(logoContentView)
        logoContentView.addSubview(logoImageView)
        self.addSubview(loginContentView)
        loginContentView.addSubview(emailLabelContentView)
        emailLabelContentView.addSubview(emailLabel)
        loginContentView.addSubview(emailContentView)
        emailContentView.addSubview(emailTextField)
        emailContentView.addSubview(emailImageView)
        loginContentView.addSubview(passwordLabelContentView)
        passwordLabelContentView.addSubview(passwordLabel)
        loginContentView.addSubview(passwordContentView)
        passwordContentView.addSubview(passwordTextField)
        passwordContentView.addSubview(passwordImageView)
        passwordContentView.addSubview(passwordHideButton)
        self.addSubview(buttonEnterContentView)
        buttonEnterContentView.addSubview(buttonEnter)
        emailContentView.addSubview(imageErrorEmail)
        passwordContentView.addSubview(imageErrorPassword)
        self.addSubview(labelError)
    }
    
    func setupTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        let tapReturn = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        self.addGestureRecognizer(tapReturn)
    }
    
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
        emailLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        emailLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        passwordLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        passwordLabel.font = UIFont(name: "Rubik-Regular", size: 14)
    }
    
    func loginError() {
        emailContentView.layer.borderColor = UIColor.red.cgColor
        emailContentView.layer.borderWidth = 1
        passwordContentView.layer.borderColor = UIColor.red.cgColor
        passwordContentView.layer.borderWidth = 1
        passwordHideButton.isHidden = true
        imageErrorEmail.isHidden = false
        imageErrorPassword.isHidden = false
        labelError.isHidden = false
    }
    
    func setConstraints() {
                
        logoContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-80)
            make.height.equalToSuperview()
        }
        
        loginContentView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        emailLabelContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(18)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        emailContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabelContentView.snp_bottomMargin).offset(22)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(48)
        }
        
        emailImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.height.equalTo(20)
            make.width.equalTo(25)
        }
        
        passwordLabelContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(22)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(18)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        passwordContentView.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabelContentView.snp_bottomMargin).offset(22)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(48)
        }
        
        passwordImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.height.width.equalTo(25)
        }

        
        passwordHideButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(15)
            make.width.equalTo(22)
        }
        
        buttonEnterContentView.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(316)
        }
        
        buttonEnter.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(48)
        }
        
        imageErrorEmail.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        imageErrorPassword.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        labelError.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin).offset(4)
            make.right.equalToSuperview().offset(-20)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        emailLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        emailLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        passwordLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        passwordLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        return false
    }
    
    @objc func emailChangeColorClickedTextField() {
        textFieldDidBeginEditing(emailTextField)
        buttonEnterClicked(sender: buttonEnter)
    }
    
    @objc func passwordChangeColorClickedTextField() {
        textFieldDidBeginEditing(passwordTextField)
        buttonEnterClicked(sender: buttonEnter)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailLabel.textColor = .black
            emailLabel.font = .boldSystemFont(ofSize: 18)
            emailContentView.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1).cgColor
            imageErrorEmail.isHidden = true
            labelError.isHidden = true
        } else if textField == passwordTextField {
            passwordLabel.textColor = .black
            passwordLabel.font = .boldSystemFont(ofSize: 18)
            passwordContentView.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1).cgColor
            imageErrorPassword.isHidden = true
            passwordHideButton.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            emailLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        } else if textField == passwordTextField {
            passwordLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            passwordLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        }
    }
}

