//
//  LoginViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 17.01.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var usernameTextField: SKTextField = {
        let textField = SKTextField()
        textField.placeholder = "Enter your username"
        textField.textContentType = .username
        return textField
    }()
    
    lazy var passwordTextField: SKTextField = {
        let textField = SKTextField()
        textField.placeholder = "Enter your password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgotPassowordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var loginButton: DefaultWhiteButton = {
        let button = DefaultWhiteButton()
        button.setupTitle(text: "LOGIN")
        return button
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Do not have an account yet? "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorPalette.white
        return label
    }()
    
    lazy var signUpTappableLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorPalette.yellow
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(signUpTapped(_:)))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        view.backgroundColor = ColorPalette.darkBlue
        
        setupForgotPasswordLabel()
        setupPasswordTextField()
        setupUsernameTextField()
        setupLogoImageView()
        setupLoginButton()
        setupSignUpLabels()
    }
    
    
}


extension LoginViewController {
    
    fileprivate func setupUsernameTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(24)
            make.height.equalTo(44)
            make.bottom.equalTo(passwordTextField.snp.top).offset(-24)
        }
    }
    
    fileprivate func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(24)
            make.height.equalTo(44)
            make.bottom.equalTo(forgotPassowordLabel.snp.top).offset(-12)
        }
    }
    
    fileprivate func setupForgotPasswordLabel() {
        view.addSubview(forgotPassowordLabel)
        forgotPassowordLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(24)
            make.bottom.equalTo(view.snp.centerY)
        }
    }
    
    fileprivate func setupLogoImageView() {
        let logoSuperview = UIView()
        logoSuperview.backgroundColor = .clear
        
        view.addSubview(logoSuperview)
        logoSuperview.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(usernameTextField.snp.top)
        }
        
        logoSuperview.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.center.equalTo(logoSuperview)
            make.height.equalTo(48)
        }
    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPassowordLabel.snp.bottom).offset(64)
            make.left.equalTo(view).offset(24)
            make.centerX.equalTo(view)
            make.height.equalTo(48)
        }
    }
    
    fileprivate func setupSignUpLabels() {
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.left.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(12)
        }
        
        view.addSubview(signUpTappableLabel)
        signUpTappableLabel.snp.makeConstraints { make in
            make.left.equalTo(signUpLabel.snp.right)
            make.centerY.equalTo(signUpLabel)
        }
    }
    
    
}

extension LoginViewController {
    
    @objc func forgotPasswordTapped(_ sender: UITapGestureRecognizer) {
        print(NSString(#file).lastPathComponent + ": forgot password tapped")
    }
    
    @objc func signUpTapped(_ sender: UITapGestureRecognizer) {
        let vc = SignUpNameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

