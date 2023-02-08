//
//  WeeklyStatisticView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 23.01.2023.
//

import UIKit
import SnapKit

class WeeklyStatisticView: SKCardView {
    
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
    
    fileprivate func setupStatisticCollectionView() {
        addSubview(statisticsCollectionView)
        
        statisticsCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
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
        return CGSize(width: 52, height: 72)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    
}
