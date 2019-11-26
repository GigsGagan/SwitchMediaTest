//
//  ThemeDefault.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 18/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

class ThemeDefault: Theme {
    // MARK: Common
    func showCategoryTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: 2)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
    }
    
    func showItemTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 9)
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
    }
    
    func showDetailTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 18, weight: 1)
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textColor = UIColor.black
    }
    
    func showDetailDescriptionLabelStyle(label: UILabel) {
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
    }
    
    func showDetailYearLabelStyle(label: UILabel) {
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
    }
    
    func showDetailDismissButtonStyle(button: UIButton) {
        button.backgroundColor = UIColor.clear
        button.setImage( UIImage.init(named: "dismiss"), for: UIControlState.normal)
    }
}
