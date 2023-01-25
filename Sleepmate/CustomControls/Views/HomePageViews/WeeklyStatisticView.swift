//
//  WeeklyStatisticView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 23.01.2023.
//

import UIKit
import SnapKit

class WeeklyStatisticView: UIView {
    
    var statistics: [DailyStatistic] = [] {
        didSet {
            statisticsCollectionView.reloadData()
            statisticsCollectionView.scrollToLastItem(at: .right, animated: false)
        }
    }
    
    lazy var statisticsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.semanticContentAttribute = .forceLeftToRight
        collectionView.register(WeeklyStatisticCollectionViewCell.self, forCellWithReuseIdentifier: "WeeklyStatisticCollectionViewCell")
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
        
        
        Server.shared.getStatistics { statusCode, body in
            if statusCode == 200 {
                self.statistics = body as! [DailyStatistic]
            } else {
                fatalError("Temporary test")
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupStatisticCollectionView()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}


extension WeeklyStatisticView {
    
    fileprivate func updateUI() {
        backgroundColor = ColorPalette.blue
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
    fileprivate func setupStatisticCollectionView() {
        addSubview(statisticsCollectionView)
        
        statisticsCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    
}

extension WeeklyStatisticView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statistics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyStatisticCollectionViewCell", for: indexPath) as! WeeklyStatisticCollectionViewCell
        if cell.statistic == nil {
            cell.statistic = statistics[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 68)
    }
    
    
}
