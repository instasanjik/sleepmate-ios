//
//  AuthorizationNavigationController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 17.01.2023.
//

import UIKit

class AuthorizationNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushViewController(CarouselViewController(), animated: false)
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationBar.topItem?.backBarButtonItem = backButton
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    
}
