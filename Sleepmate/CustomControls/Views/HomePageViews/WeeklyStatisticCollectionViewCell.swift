//
//  WeeklyStatisticCollectionViewCell.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 23.01.2023.
//

import UIKit
import SnapKit

class WeeklyStatisticCollectionViewCell: UICollectionViewCell {
    
    var statistic: DailyStatistic? {
        didSet {
            guard let statistic = statistic else { return }
            setData(statistic)
        }
    }
    
    lazy var circularProgressBarView = CircularProgressBarView(frame: CGRect(x: 0, y: 0, width: 46, height: 46))
    
    lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    
    override func awakeFromNib() {
        backgroundColor = .clear
    }
    
    
    override func draw(_ rect: CGRect) {
        setupProgressBarView()
        setupWeekDayLabel()
        super.draw(rect)
    }
    
    
    override func prepareForReuse() {
        layoutIfNeeded()
        super.prepareForReuse()
    }
    
    
    fileprivate func setData(_ statistic: DailyStatistic) {
        self.circularProgressBarView.progressAnimation(duration: 1,
                                                       newValue: Float(statistic.sleepDuration)/8,
                                                       centerLabelText: "\(Int(statistic.sleepDuration))h")
        self.weekDayLabel.text = statistic.date.dayOfWeek
    }
    
    
}


extension WeeklyStatisticCollectionViewCell {
    
    fileprivate func setupProgressBarView() {
        addSubview(circularProgressBarView)
        circularProgressBarView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(4)
            make.height.width.equalTo(46)
        }
        layoutIfNeeded()
        circularProgressBarView.createCircularPath(radius: 20, lineWidth: 6, fontSize: 12)
    }
    
    
    fileprivate func setupWeekDayLabel() {
        addSubview(weekDayLabel)
        weekDayLabel.snp.makeConstraints { make in
            make.centerX.equalTo(circularProgressBarView)
            make.height.equalTo(18)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    
}
