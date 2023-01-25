//
//  CarouselViewController.swift
//  sleepmate
//
//  Created by Sanzhar Koshkarbayev on 13.01.2023.
//

import UIKit
import SnapKit

class CarouselViewController: UIViewController {
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        carouselView.highlightItemAt(0)
    }


}

extension CarouselViewController {
    
    fileprivate func setupLogo() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    fileprivate func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        continueButton.disable()
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(view).offset(24)
            make.centerX.equalTo(view)
            make.height.equalTo(48)
        }
        continueButton.setupTitle(text: "CONTINUE")
    }
    
    fileprivate func setupCarouselView() {
        view.addSubview(carouselView)
        carouselView.delegate = self
        carouselView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(24)
            make.left.right.equalTo(view)
            make.bottom.equalTo(continueButton.snp.top).inset(-24)
        }
    }
    
    
}


extension CarouselViewController: CarouselViewDelegate {
    
    @objc func continueTapped() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func userHasFinishedViewingCarousel() {
        continueButton.enable()
    }
    
    
}
