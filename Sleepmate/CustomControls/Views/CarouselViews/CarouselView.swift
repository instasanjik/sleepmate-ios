//
//  CarouselView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 16.01.2023.
//

import UIKit
import SnapKit

protocol CarouselViewDelegate: AnyObject {
    func userHasFinishedViewingCarousel()
}

class CarouselView: UIView {
    
    var delegate: CarouselViewDelegate?
    
    let content: [CarouselItem] =   [
        CarouselItem(imageName: "carouselIllustartion1",
                     bodyText: "Track your sleep patterns and improve your sleep habits with SleepMate"),
        
        CarouselItem(imageName: "carouselIllustartion2",
                     bodyText: "Get personalized tips and resources to help you sleep better with SleepMate"),
        
        CarouselItem(imageName: "carouselIllustartion3",
                     bodyText: "Say goodbye to insomnia with SleepMate's interactive and engaging approach"),
        
    ]
    
    lazy var carouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarouselItemCollectionViewCell.self, forCellWithReuseIdentifier: "carouselItem")
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var indicatorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(IndicatorCollectionViewCell.self, forCellWithReuseIdentifier: "indicatorView")
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollectionView()
        setupIndicatorsView()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CarouselView {
    
    fileprivate func setupCollectionView() {
        addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self).inset(40)
        }
    }
    
    
    fileprivate func setupIndicatorsView() {
        addSubview(indicatorsCollectionView)
        indicatorsCollectionView.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(24)
            make.centerX.equalTo(self)
            make.height.equalTo(8)
            make.width.equalTo(16 * content.count - 2)
        }
    }
    
    
}

extension CarouselView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case carouselCollectionView:
            return CGSize(width: Screen.width, height: bounds.height)
        case indicatorsCollectionView:
            return CGSize(width: 8, height: 8)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case carouselCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselItem", for: indexPath) as! CarouselItemCollectionViewCell
            cell.setupItem(content[indexPath.row])
            return cell
        case indicatorsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "indicatorView", for: indexPath) as! IndicatorCollectionViewCell
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == carouselCollectionView else { return }
        for cell in carouselCollectionView.visibleCells {
            if let indexPath = carouselCollectionView.indexPath(for: cell) {
                highlightItemAt(indexPath.row)
                if indexPath.row == content.count - 1 {
                    delegate?.userHasFinishedViewingCarousel()
                }
            }
        }
    }
    
    func highlightItemAt(_ row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        indicatorsCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    
}
