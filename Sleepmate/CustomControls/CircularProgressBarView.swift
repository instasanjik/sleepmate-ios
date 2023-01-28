//
//  CircularProgressBarView.swift
//  TestCircularProgressBar
//
//  Created by Cem Kazım on 8.11.2020.
//
//  Availability: https://cemkazim.medium.com/how-to-create-animated-circular-progress-bar-in-swift-f86c4d22f74b
//

import UIKit
import SnapKit

class CircularProgressBarView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    lazy var centerValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension CircularProgressBarView {
    
    func createCircularPath(radius: CGFloat = 20, lineWidth: CGFloat = 8, fontSize: CGFloat = 12) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0,
                                                           y: frame.size.height / 2.0),
                                        radius: radius,
                                        startAngle: startPoint,
                                        endAngle: endPoint,
                                        clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = ColorPalette.black.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = ColorPalette.yellow.cgColor
        layer.addSublayer(progressLayer)

        addSubview(centerValueLabel)
        centerValueLabel.font = UIFont.systemFont(ofSize: fontSize)
        centerValueLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}


extension CircularProgressBarView {
    
    func progressAnimation(duration: TimeInterval, newValue: Float, centerLabelText: String) {
        centerValueLabel.text = centerLabelText
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = newValue
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
    
}
