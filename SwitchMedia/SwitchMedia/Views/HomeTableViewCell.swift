//
//  HomeTableViewCell.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HomeTableViewCellDelegate: class {
    
    func didselectCategoryCell(cellTag: Int, index: Int)
}

class HomeTableViewCell: UITableViewCell {
    
    // MARK:- Variables
    var selectedItem:[Items] = [Items]()
    var selectedTitle:String = String()
    weak var delegate: HomeTableViewCellDelegate?
    
    let categoryTitleLbl: UILabel = {
        let label = UILabel()
        ThemeManager.showCategoryTitleLabelStyle(label: label)
        return label
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: Constants.CategoryCellID)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    // MARK:- Required Lifecycle Methods
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        self.setupCollectionView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK:- Private Methods
    func setupCollectionView() {
        self.addSubview(categoryTitleLbl)
        self.addSubview(categoryCollectionView)
        
        self.categoryTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.categoryTitleLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0).isActive = true
        self.categoryTitleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5).isActive = true
        self.categoryTitleLbl.topAnchor.constraint(equalTo: self.topAnchor,constant: 0).isActive = true
        self.categoryTitleLbl.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        self.categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.categoryCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0).isActive = true
        self.categoryCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5).isActive = true
        self.categoryCollectionView.topAnchor.constraint(equalTo: self.topAnchor,constant: 25).isActive = true
        self.categoryCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0).isActive = true
    }
    
    // MARK:- Allocating Values
    func setHomeCell(categoryValue: [Categorys], index : Int){
        self.categoryCollectionView.tag = index
        self.selectedItem = categoryValue[0].items
        self.categoryTitleLbl.text = categoryValue[0].category
        self.selectedTitle = categoryValue[0].category
        self.categoryCollectionView.reloadData()
    }
}

//MARK:- UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CategoryCellID, for: indexPath) as! CategoryCollectionCell
        cell.setupCategoryCollectionCell(selectedItem: self.selectedItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.selectedTitle.lowercased() == CategoryType.Movies.rawValue {
            return CGSize(width: CategoryTypeWidth.Movies.rawValue, height: 135)
        }
        return CGSize(width: CategoryTypeWidth.Rest.rawValue, height: CategoryTypeWidth.Movies.rawValue  )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

//MARK:- UICollectionViewDelegate
extension HomeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didselectCategoryCell(cellTag: collectionView.tag, index: indexPath.row)
    }
}
