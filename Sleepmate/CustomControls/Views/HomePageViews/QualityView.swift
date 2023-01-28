//
//  QualityView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.01.2023.
//

import UIKit
import SnapKit

class QualityView: UIView {
    
    var quality: Float = 0 {
        didSet {
            circularProgressBarView.progressAnimation(duration: 1,
                                                      newValue: quality / 100,
                                                      centerLabelText: "\(Int(quality))%")
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Quality"
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var circularProgressBarView = CircularProgressBarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorPalette.blue
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupTitleLabel()
        setupCircularProgressBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension QualityView {
    
    fileprivate func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(16)
        }
    }
    
    fileprivate func setupCircularProgressBar() {
        addSubview(circularProgressBarView)
        circularProgressBarView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(circularProgressBarView.snp.height)
        }
        layoutIfNeeded()
        circularProgressBarView.createCircularPath(radius: 48, lineWidth: 14)
        circularProgressBarView.centerValueLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    
    
}
