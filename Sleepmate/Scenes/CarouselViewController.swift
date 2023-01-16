//
//  CarouselViewController.swift
//  sleepmate
//
//  Created by Sanzhar Koshkarbayev on 13.01.2023.
//

import UIKit
import SnapKit

class CarouselViewController: SKViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    lazy var carouselView = CarouselView()
    lazy var continueButton = DefaultWhiteButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.darkBlue
        setupLogo()
        setupContinueButton()
        setupCarouselView()
    }


}

extension CarouselViewController {
    
    func setupLogo() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(view).offset(24)
            make.centerX.equalTo(view)
            make.height.equalTo(44)
        }
        continueButton.setupTitle(text: "CONTINUE")
    }
    
    func setupCarouselView() {
        view.addSubview(carouselView)
        carouselView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(24)
            make.left.right.equalTo(view)
            make.bottom.equalTo(continueButton.snp.top).inset(-24)
        }
    }
    
    
}
