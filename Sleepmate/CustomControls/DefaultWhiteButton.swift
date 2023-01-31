//
//  WhiteButton.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 16.01.2023.
//

import UIKit

class DefaultWhiteButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 14
        backgroundColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        setTitleColor(ColorPalette.black, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupTitle(text: String) {
        setTitle(text, for: .normal)
    }
    
    
    func disable() {
        alpha = 0.7
        isEnabled = false
    }
    
    
    func enable() {
        alpha = 1
        isEnabled = true
    }
    

}
