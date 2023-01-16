//
//  IndicatorCollectionViewCell.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 17.01.2023.
//

import UIKit

class IndicatorCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            indicatorView.backgroundColor = isSelected ? ColorPalette.lightGray : ColorPalette.darkGray
        }
    }
    
    lazy var indicatorView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addSubview(indicatorView)
        indicatorView.layer.masksToBounds = true
        indicatorView.layer.cornerRadius = 4
        indicatorView.backgroundColor = ColorPalette.darkGray
        indicatorView.frame = bounds
    }
    
    
}
