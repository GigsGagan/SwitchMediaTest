//
//  IpadTheme.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 18/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

class IpadTheme: Theme {
    // MARK: Common
    func showCategoryTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 22, weight: 0.5)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
    }
    
    func showItemTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
    }
    
    func showDetailTitleLabelStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 25, weight: 0.5)
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textColor = UIColor.black
    }
    
    func showDetailDescriptionLabelStyle(label: UILabel) {
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 18)
    }
    
    func showDetailYearLabelStyle(label: UILabel) {
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
    }
    
    func showDetailDismissButtonStyle(button: UIButton) {
        button.backgroundColor = UIColor.clear
        button.setImage( UIImage.init(named: "dismiss"), for: UIControlState.normal)
    }
}
