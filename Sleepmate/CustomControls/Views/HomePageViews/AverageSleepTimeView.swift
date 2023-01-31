//
//  AverageSleepTimeView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.01.2023.
//

import UIKit
import SnapKit

class AverageSleepTimeView: SKCardView {
    
    var hoursValue: String = "-" {
        didSet {
            hoursLabel.text = hoursValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Average \nsleep time \nthis week"
        label.numberOfLines = 3
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.text = hoursValue
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        return label
    }()
    
    lazy var hoursPerDayLabel: UILabel = {
        let label = UILabel()
        label.text = "hours \nper day"
        label.numberOfLines = 2
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupTitleLabel()
        setupHoursLabel()
        setupHoursPerDayLabel()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension AverageSleepTimeView {
    
    fileprivate func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
    }
    
    
    fileprivate func setupHoursLabel() {
        addSubview(hoursLabel)
        hoursLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.centerY)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self.snp.centerX).offset(-2)
            make.bottom.equalToSuperview()
        }
    }
    
    
    fileprivate func setupHoursPerDayLabel() {
        addSubview(hoursPerDayLabel)
        hoursPerDayLabel.snp.makeConstraints { make in
            make.top.equalTo(hoursLabel)
            make.left.equalTo(self.snp.centerX).offset(2)
            make.right.equalTo(titleLabel)
            make.bottom.equalToSuperview()
        }
    }
    
    
}
