//
//  InfoBlockView.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 29.01.2023.
//

import UIKit
import SnapKit

class InfoBlockView: UIView {
    
    lazy var imageView = UIImageView()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = ColorPalette.systemGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    fileprivate func setupUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.left.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).inset(-8)
            make.top.equalTo(imageView).inset(-6)
            make.right.equalToSuperview()
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).inset(-8)
            make.bottom.equalTo(imageView).inset(-6)
            make.right.equalToSuperview()
        }
    }
    
    
    func setupInfo(imageName: String, value: String, description: String) {
        imageView.image = UIImage(named: imageName)
        valueLabel.text = value
        descriptionLabel.text = description
    }
    
    
}



