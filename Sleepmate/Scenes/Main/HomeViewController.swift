//
//  HomeViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 22.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

}


extension HomeViewController {
    
    func updateUI() {
        view.backgroundColor = ColorPalette.darkBlue
    }
    
    
}

