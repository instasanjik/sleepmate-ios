//
//  InfoViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 22.01.2023.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    var experts: [Expert] = []
    
    lazy var expertsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sleep experts"
        label.textColor = ColorPalette.white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var expertsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 122, height: 180)
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExpertCollectionViewCell.self, forCellWithReuseIdentifier: "ExpertCollectionViewCell")
        return collectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        experts = Server.shared.getExperts()
        updateUI()
        setupExpertsTitleLabel()
        setupExpertsCollectionView()
    }
    

}


extension InfoViewController {
    
    fileprivate func updateUI() {
        view.backgroundColor = ColorPalette.darkBlue
    }
    
    fileprivate func setupExpertsTitleLabel() {
        view.addSubview(expertsTitleLabel)
        expertsTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(64)
        }
    }
    
    fileprivate func setupExpertsCollectionView() {
        view.addSubview(expertsCollectionView)
        expertsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(expertsTitleLabel.snp.bottom).inset(-12)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
//    fileprivate func
    
    
}

extension InfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return experts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpertCollectionViewCell", for: indexPath) as! ExpertCollectionViewCell
        cell.expert = experts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }

    
}

