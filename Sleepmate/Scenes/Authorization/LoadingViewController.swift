//
//  LoadingViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 21.01.2023.
//

import UIKit
import SnapKit
import Lottie

class LoadingViewController: UIViewController {
    lazy var infomarionSearchingAnimation = LottieAnimationView(name: "InformationSearchingAnimation")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.darkBlue
        setupAnimationView()
        
        // TODO: delete fake transition
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToMainTabbarViewController()
        }
    }
    

}

extension LoadingViewController {
    
    fileprivate func setupAnimationView() {
        view.addSubview(infomarionSearchingAnimation)
        infomarionSearchingAnimation.play()
        infomarionSearchingAnimation.loopMode = .loop
        infomarionSearchingAnimation.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).inset(126)
            make.height.greaterThanOrEqualTo(86)
            make.height.lessThanOrEqualTo(200)
        }
    }
    
    
    fileprivate func goToMainTabbarViewController() {
        let vc = MainTabbarViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
