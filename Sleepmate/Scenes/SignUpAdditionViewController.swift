//
//  SignUpAdditionViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 21.01.2023.
//

import UIKit
import SnapKit

class SignUpAdditionViewController: UIViewController {
    
    var name: String = ""
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.transform = CGAffineTransform(rotationAngle: -0.26 * Double.pi)
        return imageView
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Nice to meet you, \(name)!\nLet’s fill additional data"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = ColorPalette.white
        label.numberOfLines = 2
        return label
    }()
    
    lazy var formSuperView = UIView()
    
    lazy var usernameTextField: SKTextField = {
        let textField = SKTextField()
        textField.placeholder = "Enter your username"
        textField.textContentType = .username
        return textField
    }()
    
    lazy var passwordTextField: SKTextField = {
        let textField = SKTextField()
        textField.placeholder = "Enter your password"
        textField.textContentType = .oneTimeCode
        return textField
    }()
    
    lazy var signUpButton = DefaultWhiteButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.darkBlue
        navigationItem.title = "Sign Up"
        
        setupLogoImageView()
        setupGreetingLabel()
        setupSignUpFormView()
    }
    
    
}


extension SignUpAdditionViewController {
    
    func setupLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(48)
            make.height.equalTo(79)
            make.width.equalTo(98)
            make.right.equalTo(view).inset(-30)
        }
    }
    
    func setupGreetingLabel() {
        view.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(40)
            make.centerY.equalTo(logoImageView)
        }
    }
    
    func setupSignUpFormView() {
        view.addSubview(formSuperView)
        formSuperView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(24)
        }
        setupUsernameTextField()
        setupPasswordTextField()
        setupSignUpButton()
    }
    
    func setupUsernameTextField() {
        formSuperView.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.left.centerX.top.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    func setupPasswordTextField() {
        formSuperView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).inset(-24)
            make.left.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    func setupSignUpButton() {
        formSuperView.addSubview(signUpButton)
        signUpButton.setupTitle(text: "SIGN UP")
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).inset(-44)
            make.left.centerX.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
    }
    
    
}


extension SignUpAdditionViewController {
    
    @objc func signUpTapped() {
        
    }
    
    
}
