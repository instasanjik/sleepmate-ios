//
//  SignUpViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 20.01.2023.
//

import UIKit
import SnapKit

class SignUpNameViewController: UIViewController {
    
    lazy var nameTextField: SKTextField = {
        let textField = SKTextField()
        textField.placeholder = "Enter your name"
        textField.textContentType = .name
        return textField
    }()
    
    lazy var continueButton = DefaultWhiteButton()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hey there👋\nHow can I call you?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = ColorPalette.white
        label.numberOfLines = 2
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.transform = CGAffineTransform(rotationAngle: -0.26 * Double.pi)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.darkBlue
        navigationItem.title = "Sign Up"
        
        setupNameTextField()
        setupContinueButton()
        setupGreetingLabel()
        setupLogoImageView()
    }
    
    
}


extension SignUpNameViewController {
    
    func setupNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.left.equalTo(view).offset(24)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp.centerY)
            make.height.equalTo(44)
        }
    }
    
    func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        continueButton.setupTitle(text: "CONTINUE")
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.left.equalTo(view).offset(24)
            make.centerX.equalTo(view)
            make.top.equalTo(nameTextField.snp.bottom).offset(44)
        }
    }
    
    func setupGreetingLabel() {
        view.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(40)
            make.bottom.equalTo(nameTextField.snp.top).inset(-120)
        }
    }
    
    func setupLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(greetingLabel)
            make.height.equalTo(79)
            make.width.equalTo(98)
            make.right.equalTo(view).inset(-30)
        }
    }
    
    
}


extension SignUpNameViewController {
    
    @objc func continueTapped() {
        print("continue tapped")
    }
    
    
}
