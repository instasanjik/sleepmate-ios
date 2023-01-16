//
//  CarouselView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 16.01.2023.
//

import UIKit

class CarouselView: UIView {
    let content: [String : String] =   [
        "carouselIllustartion1" : "Track your sleep patterns and improve your sleep habits with SleepMate",
        "carouselIllustartion2" : "Get personalized tips and resources to help you sleep better with SleepMate",
        "carouselIllustartion3" : "Say goodbye to insomnia with SleepMate's interactive and engaging approach"
    ]
    
    let carouselCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(CarouselItemCollecitonViewCell.self, forCellWithReuseIdentifier: "caroiuselItem")
        collectionView.isPagingEnabled = true
        collectionView.backgroundView?.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class CarouselItemCollecitonViewCell: UICollectionViewCell {
    
}
