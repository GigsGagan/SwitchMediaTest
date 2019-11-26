//
//  ApiServiceManager.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit
import ObjectMapper

class ApiServiceManager {
    
    struct ServiceUrls {
        static let BaseUrl = "https://pastebin.com/raw/8LiEHfwU"
    }
    
    // MARK:- Category Api Request
    class func getCategoryApiRequest()  -> Promise<[Categorys]> {
        return Promise { fulfill, reject in
            
            let url = ServiceUrls.BaseUrl
            let nsURL = URL(string: url)!
            let session = URLSession.shared
            let task = session.dataTask(with: nsURL, completionHandler: { data, response, error -> Void in
                if error != nil{
                    reject(error!)
                }
                if data != nil {
                    if let response = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                        let responseArray: NSArray = response as! NSArray
                        if responseArray.count > 0 {
                            var categoryList : [Categorys] = [Categorys]()
                            for movie in responseArray {
                                if let aMovie = Mapper<Categorys>().map(JSONObject: movie) {
                                    categoryList.append(aMovie)
                                }
                            }
                            fulfill(categoryList)
                        }else{
                            reject(error!)
                        }
                    }
                }else{ reject(error!) }
                session.invalidateAndCancel()
            })
            task.resume()
        }
    }
    
    
}
