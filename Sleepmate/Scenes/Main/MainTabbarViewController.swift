//
//  MainTabbarViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 22.01.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        updateTabbarUI()
        selectedIndex = 1
    }
    

}

extension MainTabbarViewController {
    
    func updateTabbarUI() {
        tabBar.tintColor = ColorPalette.yellow
        
        let positionX: CGFloat = 24
        let positionY: CGFloat = 8
        let width = tabBar.bounds.width - positionX * 2
        let height: CGFloat = 53
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionX,
                                y: tabBar.bounds.minY - positionY,
                                width: width,
                                height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = ColorPalette.white.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5.5
        tabBar.itemPositioning = .centered
        tabBar.unselectedItemTintColor = ColorPalette.systemGray
    }
    
    func configureViewControllers() {
        viewControllers = [
            prepareViewController(SleepControlViewController(), imageName: "moon"),
            prepareViewController(HomeViewController(), imageName: "house"),
            prepareViewController(InfoViewController(), imageName: "book"),
            prepareViewController(ProfileViewController(), imageName: "user")
        ]
    }
    
    private func prepareViewController(_ viewController: UIViewController, title: String? = nil, imageName: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
    
    
}
