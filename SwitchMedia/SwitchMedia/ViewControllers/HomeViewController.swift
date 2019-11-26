//
//  HomeViewController.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

class HomeViewController : BaseViewController {
    
    // MARK:- Variables
    fileprivate var manager: CategoryManager!
    fileprivate var targetCategorys : [Categorys]?
    
    let homeTableView: UITableView =  UITableView()
    let loadingScreen: LoadingScreen = LoadingScreen()
    var pullToRefresh: UIRefreshControl? = nil
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupManager()
        self.setupHomeScreenUI()
    }
    
    //MARK:- Private Methods
    private func setupManager() {
        loadingScreen.showLoadingScreen()
        self.manager = CategoryManager.init()
        self.manager.delegate = self
    }
    
    private func setupHomeScreenUI() {
        self.setTitle(title: "Home")
        
        func setupConstraints() {
            self.homeTableView.translatesAutoresizingMaskIntoConstraints = false
            self.homeTableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 10).isActive = true
            self.homeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
            self.homeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
            self.homeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive = true
        }
        
        // add to subview
        self.view.addSubview(self.homeTableView)
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        self.homeTableView.separatorStyle = .none
        setupConstraints()
    }
}

//MARK:- CategoryManagerDelegate Protocol Method
extension HomeViewController : CategoryManagerDelegate {
    
    @objc internal func didUpdateCategoryList() {
        self.loadingScreen.hideLoadingScreen()
        self.homeTableView.reloadData()
    }
    
    @objc internal func didUpdateErrorWithAlert( error: NSError){
        self.loadingScreen.hideLoadingScreen()
        self.showAlert(message: error.localizedDescription)
    }
}

//MARK:- HomeTableViewCellDelegate Protocol Method
extension HomeViewController : HomeTableViewCellDelegate {
    
    @objc internal func didselectCategoryCell(cellTag: Int, index: Int){
        if let value = manager?.categoryArray[cellTag] {
            let detailsVw: DetailsView = DetailsView()
            detailsVw.showDetailScreen( item : value.items[index] )
        }
    }
}

//MARK:- UITableViewDataSource
extension HomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let categoryValue = manager?.categoryArray[indexPath.row] {
            let cell:HomeTableViewCell = HomeTableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"cell");
            cell.setHomeCell(categoryValue: [categoryValue], index: indexPath.row)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170
        }
        return 230
    }
}

//MARK:- UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
