//
//  ExpertCollectionViewCell.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 30.01.2023.
//

import UIKit
import SnapKit

class ExpertCollectionViewCell: UICollectionViewCell {
    
    var expert: Expert? {
        didSet {
            guard let expert = expert else { return }
            updateData(expert)
        }
    }
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.systemGray
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 3
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorPalette.blue
        layer.masksToBounds = true
        layer.cornerRadius = 16
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension ExpertCollectionViewCell {
    
    
    fileprivate func setupUI() {
        setupAvatarImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    
    fileprivate func setupAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(avatarImageView.snp.width)
        }
    }
    
    
    fileprivate func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(4)
            make.left.right.equalTo(avatarImageView)
            make.height.equalTo(16)
        }
    }
    
    
    fileprivate func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.right.equalTo(nameLabel)
            make.bottom.equalToSuperview().priority(100)
        }
    }
    
    
}

extension ExpertCollectionViewCell {
    
    fileprivate func updateData(_ expert: Expert) {
        let placeholderImageName = expert.gender == .man ? "PlaceholderMan" : "PlaceholderWoman"
        avatarImageView.image = UIImage(named: placeholderImageName)
        // TODO: download image from the internet
        nameLabel.text = expert.name
        if expert.lastName[0] != "" {
            nameLabel.text! += " \(expert.lastName[0])."
        }
        descriptionLabel.text = expert.shortDesctiprion
    }
    
    
}
