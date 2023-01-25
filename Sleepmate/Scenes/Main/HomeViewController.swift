//
//  HomeViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 22.01.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: Screen.width, height: Screen.height * 2)
        return scrollView
    }()
    
    lazy var dayNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Today, Thursday"
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = ColorPalette.systemGray
        label.text = "24 April 2023"
        return label
    }()
    
    
    
    lazy var circularProgressBarView: CircularProgressBarView = {
        let progressBar = CircularProgressBarView()
        progressBar.backgroundColor = .red
        return progressBar
    }()
    
    lazy var weeklyStatisticsView = WeeklyStatisticView()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "calendarButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

}


extension HomeViewController {
    
    fileprivate func updateUI() {
        view.backgroundColor = ColorPalette.darkBlue
        
        setupScrollView()
        setupDayNameLabel()
        setupDateLabel()
        setupCalendarButton()
        
        setupWeeklyStatisticsView()
    }
    
    fileprivate func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupDayNameLabel() {
        scrollView.addSubview(dayNameLabel)
        dayNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(64)
        }
    }
    
    fileprivate func setupDateLabel() {
        scrollView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(dayNameLabel)
            make.top.equalTo(dayNameLabel.snp.bottom).offset(4)
        }
    }
    
    fileprivate func setupCalendarButton() {
        scrollView.addSubview(calendarButton)
        calendarButton.snp.makeConstraints { make in
            make.centerY.equalTo(dayNameLabel)
            make.right.equalTo(view).inset(24)
            make.height.width.equalTo(32)
        }
    }
    
    fileprivate func setupWeeklyStatisticsView() {
        scrollView.addSubview(weeklyStatisticsView)
        weeklyStatisticsView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).inset(-24)
            make.height.equalTo(96)
            make.left.equalTo(dateLabel)
        }
    }
    
    
}

