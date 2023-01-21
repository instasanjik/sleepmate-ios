//
//  UIView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 21.01.2023.
//

import UIKit

extension UIView {
    
    func shake(duration: Float = 0.6, force: Float = 20) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = CFTimeInterval(duration)
        animation.values = [-force, force, -force, force, -force/2, force/2, -force/4, force/4, 0]
        layer.add(animation, forKey: "shake")
    }
    
    
}
