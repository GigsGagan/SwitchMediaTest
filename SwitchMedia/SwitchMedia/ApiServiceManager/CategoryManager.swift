//
//  CategoryManager.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 17/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit
import ObjectMapper

@objc protocol CategoryManagerDelegate: class {
    
    func didUpdateCategoryList()
    func didUpdateErrorWithAlert( error: NSError)
}

public enum CategoryType: String {
    case Movies    = "movies"
    case Rest      = "rest"
}

public enum CategoryTypeWidth: CGFloat {
    case Movies    = 200
    case Rest      = 117
}

class CategoryManager: NSObject {
    
    var categoryArray:[Categorys] = [Categorys]()
    weak var delegate: CategoryManagerDelegate?
    
    override init() {
        super.init()
        self.loadContentForCategory()
    }
    
    fileprivate func loadContentForCategory()  {
        firstly{_ -> Promise<[Categorys]> in
            return ApiServiceManager.getCategoryApiRequest()
            }.then { response -> Void in
                self.handleListResponse(list: response)
            }.catch { (theError) -> Void in
                self.showAlert(errorList: theError as NSError)
        }
    }
    
    fileprivate func handleListResponse(list:[Categorys]) {
        self.categoryArray = list
        self.delegate?.didUpdateCategoryList()
    }
    
    fileprivate func showAlert(errorList:NSError) {
        self.delegate?.didUpdateErrorWithAlert( error: errorList)
    }
}




