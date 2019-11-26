//
//  CategoryCollectionCell.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CategoryCollectionCell: UICollectionViewCell {
    
    // MARK:- Variables
    let titleLabel: UILabel = {
        let label = UILabel()
        ThemeManager.showItemTitleLabelStyle(label: label)
        return label
    }()
    
    let itemImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.clear
        return img
    }()
    
    // MARK:- Required initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Private Methods
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.itemImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 0).isActive = true
        self.itemImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: 0).isActive = true
        self.itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 0).isActive = true
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.itemImageView.bottomAnchor,constant: 0).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 0).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: 0).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: 0).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    // MALR:- Allocating values
    func setupCategoryCollectionCell(selectedItem: Items) {
        self.titleLabel.text = selectedItem.title
        if self.contentView.bounds.width == CategoryTypeWidth.Movies.rawValue {
            self.itemImageView.sd_setImage(with: URL(string: (selectedItem.images?[ThumbnailType.Landscape.rawValue])!), placeholderImage: UIImage(named: "placeholder"))
        }else{
            self.itemImageView.sd_setImage(with: URL(string: (selectedItem.images?[ThumbnailType.Portrait.rawValue])!), placeholderImage: UIImage(named: "placeholder"))
        }
    }
}

