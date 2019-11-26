//
//  Category.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation

import ObjectMapper

class Categorys : Mappable {
    
    struct ParseKeys {
        static let Category      = "category"
        static let Items         = "items"
    }
    
    var category                 : String
    var items                    : [Items]
  
    init() {
        self.category            = ""
        self.items               = []
    }
    
    required init(map : Map) {
        self.category            = ""
        self.items               = []
    }
    
    func mapping(map : Map) {
        self.category            <- map[ParseKeys.Category]
        self.items               <- map[ParseKeys.Items]
    }
}
