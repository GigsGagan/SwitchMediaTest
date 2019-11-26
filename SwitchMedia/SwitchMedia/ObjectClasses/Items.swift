//
//  Items.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import ObjectMapper

class Items: Mappable {
    var title           : String?
    var year            : Int?
    var description     : String?
    var images          : [String : String]?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        title           <- map["title"]
        year            <- map["year"]
        description     <- map["description"]
        images          <- map["images"]
    }
}

public enum ThumbnailType : String {
    case Portrait   = "portrait"
    case Landscape  = "landscape"
}

