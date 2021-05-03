import UIKit
import SnapKit

final class LoginView: UIView {
    var didTapOk: (((email: String, password: String)) -> Void)?

    private let logoContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorBlack.rawValue)
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: TextModel.logoPlayMovies.rawValue)
        return image
    }()
        
    private let loginContentView = UIView()
    
    private let emailLabelContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorBlack.rawValue)
        return view
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = TextModel.nameEmail.rawValue
        label.font = Fonts.rubikRegular()
        label.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        return label
    }()
    
    private let emailContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorGrayLight.rawValue)
        view.layer.cornerRadius = DesignDefaults.numberFour
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor =  UIColor(named: TextModel.colorGrayLight.rawValue)
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: TextModel.email.rawValue,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: TextModel.colorGrayMedium.rawValue) ?? .gray])
        textField.textColor = UIColor(named: TextModel.colorPinkMedium.rawValue)
        textField.addTarget(self, action:#selector(emailChangeColorClickedTextField), for: .touchUpInside)
        return textField
    }()
    
    private let emailImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: TextModel.envelope.rawValue)
        image.tintColor = UIColor(named: TextModel.colorBlack.rawValue)
        return image
    }()
    
    private let passwordLabelContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorBlack.rawValue)
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = TextModel.namePassword.rawValue
        label.font = Fonts.rubikRegular()
        label.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        return label
    }()
    
    private let passwordContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorGrayLight.rawValue)
        view.layer.cornerRadius = DesignDefaults.numberFour
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: TextModel.colorGrayLight.rawValue)
        textField.keyboardType = .numbersAndPunctuation
        textField.attributedPlaceholder = NSAttributedString(string: TextModel.password.rawValue,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: TextModel.colorGrayMedium.rawValue) ?? .gray])
        textField.textColor = UIColor(named: TextModel.colorPinkMedium.rawValue)
        textField.addTarget(self, action:#selector(passwordChangeColorClickedTextField), for: .touchUpInside)
        return textField
    }()
    
    private let passwordImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: TextModel.lock.rawValue)
        image.tintColor = UIColor(named: TextModel.colorBlack.rawValue)
        return image
    }()
    
    private let passwordHideButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: TextModel.eyeFill.rawValue)
        button.tintColor = UIColor(named: TextModel.colorBlack.rawValue)
        button.setImage(image, for: .normal)
        button.addTarget(self, action:#selector(buttonHideClicked), for: .touchUpInside)
        return button
    }()
    
    private let buttonEnterContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: TextModel.colorPinkMedium.rawValue)
        view.layer.cornerRadius = DesignDefaults.numberTwelve
        return view
    }()
    
    private let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(TextModel.entrar.rawValue, for: .normal)
        button.backgroundColor = UIColor(named: TextModel.colorPinkMedium.rawValue)
        button.tintColor = UIColor(named: TextModel.colorWhite.rawValue)
        button.titleLabel?.font = Fonts.rubikMedium()
        button.addTarget(self, action:#selector(buttonEnterClicked), for: .touchUpInside)
        return button
    }()
    
    private let imageErrorEmail: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: TextModel.circleFill.rawValue)
        image.tintColor = UIColor(named: TextModel.colorRedMedium.rawValue)
        return image
    }()
    
    private let imageErrorPassword: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: TextModel.circleFill.rawValue)
        image.tintColor = UIColor(named: TextModel.colorRedMedium.rawValue)
        return image
    }()
    
    private let labelError: UILabel = {
        let label = UILabel()
        label.text = TextModel.credentialIncorrect.rawValue
        label.textColor = UIColor(named: TextModel.colorRedMedium.rawValue)
        label.font = Fonts.rubikLight()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: TextModel.colorBlack.rawValue)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(TextModel.namefatalError.rawValue)
    }
    
    @objc func buttonHideClicked() {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            let image = UIImage(systemName: TextModel.eyeSlashFill.rawValue)
            passwordHideButton.setImage(image, for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            let image = UIImage(systemName: TextModel.eyeFill.rawValue)
            passwordHideButton.setImage(image, for: .normal)
        }
    }
    
    @objc func buttonEnterClicked(sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        didTapOk?((email: email, password: password))
    }
    
    private func setupView() {
        setupTap()
        setupisHidden(isHidden: true)
        
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
    
    func setupisHidden(isHidden: Bool) {
        imageErrorEmail.isHidden = isHidden
        imageErrorPassword.isHidden = isHidden
        labelError.isHidden = isHidden
    }
    
    private func setupTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        let tapReturn = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        self.addGestureRecognizer(tapReturn)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
        emailLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        emailLabel.font = Fonts.rubikRegular()
        passwordLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        passwordLabel.font = Fonts.rubikRegular()
    }
    
    func loginError() {
        emailContentView.layer.borderColor = UIColor(named: TextModel.colorRedMedium.rawValue)?.cgColor
        emailContentView.layer.borderWidth = DesignDefaults.numberOne
        passwordContentView.layer.borderColor = UIColor(named: TextModel.colorRedMedium.rawValue)?.cgColor
        passwordContentView.layer.borderWidth = DesignDefaults.numberOne
        
        passwordHideButton.isHidden = true
        setupisHidden(isHidden: false)
    }
    
    private func setConstraints() {
        logoContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(DesignDefaults.numberForty)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberEighty)
            make.right.equalToSuperview().offset(-DesignDefaults.numberEighty)
            make.height.equalTo(DesignDefaults.numberOneHundredAndSixty)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        loginContentView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(DesignDefaults.numberTwoHundred)
        }
        
        emailLabelContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(DesignDefaults.numberSixteen)
            make.left.equalToSuperview().offset(DesignDefaults.numberTwenty)
            make.right.equalToSuperview().offset(-DesignDefaults.numberTwenty)
            make.height.equalTo(DesignDefaults.numberEighteen)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        emailContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabelContentView.snp_bottomMargin).offset(DesignDefaults.numberTwentyTwo)
            make.left.equalToSuperview().offset(DesignDefaults.numberSixteen)
            make.right.equalToSuperview().offset(-DesignDefaults.numberSixteen)
            make.height.equalTo(DesignDefaults.numberFortyEight)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberThirtyTwo)
            make.right.equalToSuperview().offset(-DesignDefaults.numberThirtyTwo)
            make.height.equalTo(DesignDefaults.numberFortyEight)
        }
        
        emailImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberFour)
            make.height.equalTo(DesignDefaults.numberTwenty)
            make.width.equalTo(DesignDefaults.numberTwentyFive)
        }
        
        passwordLabelContentView.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(DesignDefaults.numberTwentyTwo)
            make.left.equalToSuperview().offset(DesignDefaults.numberTwenty)
            make.right.equalToSuperview().offset(-DesignDefaults.numberTwenty)
            make.height.equalTo(DesignDefaults.numberEighteen)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        passwordContentView.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabelContentView.snp_bottomMargin).offset(DesignDefaults.numberTwentyTwo)
            make.left.equalToSuperview().offset(DesignDefaults.numberSixteen)
            make.right.equalToSuperview().offset(-DesignDefaults.numberSixteen)
            make.height.equalTo(DesignDefaults.numberFortyEight)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberThirtyTwo)
            make.right.equalToSuperview().offset(-DesignDefaults.numberThirtyTwo)
            make.height.equalTo(DesignDefaults.numberFortyEight)
        }
        
        passwordImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberFour)
            make.height.width.equalTo(DesignDefaults.numberTwentyFive)
        }

        
        passwordHideButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-DesignDefaults.numberSix)
            make.height.equalTo(DesignDefaults.numberFifteen)
            make.width.equalTo(DesignDefaults.numberTwentyTwo)
        }
        
        buttonEnterContentView.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin).offset(DesignDefaults.numberEighty)
            make.centerX.equalToSuperview()
            make.height.equalTo(DesignDefaults.numberFortyEight)
            make.width.equalTo(DesignDefaults.numberOneHundredAndFifty)
        }
        
        buttonEnter.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(DesignDefaults.numberTwelve)
            make.right.equalToSuperview().offset(-DesignDefaults.numberTwelve)
            make.height.equalTo(DesignDefaults.numberFortyEight)
        }
        
        imageErrorEmail.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-DesignDefaults.numberFour)
            make.height.equalTo(DesignDefaults.numberTwenty)
            make.width.equalTo(DesignDefaults.numberTwenty)
        }
        
        imageErrorPassword.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-DesignDefaults.numberFour)
            make.height.equalTo(DesignDefaults.numberTwenty)
            make.width.equalTo(DesignDefaults.numberTwenty)
        }
        
        labelError.snp.makeConstraints { (make) in
            make.top.equalTo(loginContentView.snp_bottomMargin).offset(DesignDefaults.numberFour)
            make.right.equalToSuperview().offset(-DesignDefaults.numberTwenty)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        emailLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        emailLabel.font = Fonts.rubikRegular()
        passwordLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
        passwordLabel.font = Fonts.rubikRegular()
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
            emailLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
            emailLabel.font = .boldSystemFont(ofSize: DesignDefaults.numberTwenty)
            emailContentView.layer.borderColor = UIColor(named: TextModel.colorGrayLight.rawValue)?.cgColor
            imageErrorEmail.isHidden = true
            labelError.isHidden = true
        } else if textField == passwordTextField {
            passwordLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
            passwordLabel.font = .boldSystemFont(ofSize: DesignDefaults.numberTwenty)
            passwordContentView.layer.borderColor =  UIColor(named: TextModel.colorGrayLight.rawValue)?.cgColor
            imageErrorPassword.isHidden = true
            passwordHideButton.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
            emailLabel.font = Fonts.rubikRegular()
        } else if textField == passwordTextField {
            passwordLabel.textColor = UIColor(named: TextModel.colorWhite.rawValue)
            passwordLabel.font = Fonts.rubikRegular()
        }
    }
}
