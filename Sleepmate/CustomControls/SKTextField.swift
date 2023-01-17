//
//  SKTextField.swift
//  sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.11.2022.
//

import UIKit

class SKTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        borderStyle = .bezel
        textColor = ColorPalette.white
        backgroundColor = ColorPalette.systemGray5
        layer.borderWidth = 1
        layer.borderColor = ColorPalette.systemGray3.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }

    var padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 16);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    

}
