//
//  File.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 18/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

enum ThemeType {
    case Default
}

class ThemeManager {
    static let sharedInstance = ThemeManager()
    private var theme: Theme
    
    init() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.theme = IpadTheme()
        }else {
            self.theme = IphoneTheme()
        }
    }
    
    func setTheme(type: ThemeType) {
        switch(type) {
        default:
            self.theme = ThemeDefault()
        }
    }
    
    // MARK: Common
    class func showCategoryTitleLabelStyle(label: UILabel) {
        self.sharedInstance.theme.showCategoryTitleLabelStyle(label: label)
    }
    
    class func showItemTitleLabelStyle(label: UILabel) {
        self.sharedInstance.theme.showItemTitleLabelStyle(label: label)
    }
    
    class func showDetailTitleLabelStyle(label: UILabel) {
        self.sharedInstance.theme.showDetailTitleLabelStyle(label: label)
    }
    
    class func showDetailDescriptionLabelStyle(label: UILabel) {
        self.sharedInstance.theme.showDetailDescriptionLabelStyle(label: label)
    }
    
    class func showDetailYearLabelStyle(label: UILabel) {
        self.sharedInstance.theme.showDetailYearLabelStyle(label: label)
    }
    
    class func showDetailDismissButtonStyle(button: UIButton) {
        self.sharedInstance.theme.showDetailDismissButtonStyle(button: button)
    }
}
