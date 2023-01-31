//
//  CarouselItemCollectionViewCell.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 16.01.2023.
//

import UIKit
import SnapKit

class CarouselItemCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupImageView()
        setupBodyLabel()
    }
    
    
    func setupItem(_ item: CarouselItem) {
        imageView.image = UIImage(named: item.imageName)
        bodyLabel.text  = item.bodyText
    }
    
    
}

extension CarouselItemCollectionViewCell {
    
    fileprivate func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.top.left.equalTo(self)
        }
    }
    
    
    fileprivate func setupBodyLabel() {
        addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.left.equalTo(self).inset(64)
        }
    }
    
    
}
