//
//  LastSleepInfoView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.01.2023.
//

import UIKit
import SnapKit

class LastSleepInfoView: SKCardView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Last sleep information"
        label.textColor = ColorPalette.white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var timeInSleepView    = InfoBlockView()
    lazy var wakeUpTimeView     = InfoBlockView()
    lazy var lyingInBedView     = InfoBlockView()
    lazy var fellAsleepView     = InfoBlockView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupTitleLabel()
        setupInfoViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension LastSleepInfoView {
    
    fileprivate func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
    }
    
    
    fileprivate func setupInfoViews() {
        let superView = UIView()
        addSubview(superView)
        superView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-24)
            make.left.right.bottom.equalToSuperview().inset(24)
        }
        
        superView.addSubview(timeInSleepView)
        setupTimeInSleepView()
        
        superView.addSubview(wakeUpTimeView)
        setupWakeUpTimeView(superView)
        
        superView.addSubview(lyingInBedView)
        setupLyingInBedView(superView)
        
        superView.addSubview(fellAsleepView)
        setupFellAsleepView(superView)
    }
    
    
    fileprivate func setupTimeInSleepView() {
        timeInSleepView.setupInfo(imageName: "MoonWhite", value: "6h 12m", description: "Time in sleep")
        timeInSleepView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.equalTo(self.snp.centerX)
            make.height.equalTo(36)
        }
    }
    
    
    fileprivate func setupWakeUpTimeView(_ superView: UIView) {
        wakeUpTimeView.setupInfo(imageName: "WarmWeather", value: "07:12 AM", description: "Wake up time")
        wakeUpTimeView.snp.makeConstraints { make in
            make.left.equalTo(superView.snp.centerX)
            make.top.right.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    
    fileprivate func  setupLyingInBedView(_ superView: UIView) {
        lyingInBedView.setupInfo(imageName: "Clock", value: "7h 23m", description: "Lying in bed")
        lyingInBedView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalTo(self.snp.centerX)
            make.bottom.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    
    fileprivate func setupFellAsleepView(_ superView: UIView) {
        fellAsleepView.setupInfo(imageName: "Zz", value: "25 min", description: "Fell asleep")
        fellAsleepView.snp.makeConstraints { make in
            make.left.equalTo(superView.snp.centerX)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    
}
