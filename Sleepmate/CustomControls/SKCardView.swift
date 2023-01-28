//
//  SKCardView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.01.2023.
//

import UIKit

class SKCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ColorPalette.blue
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
