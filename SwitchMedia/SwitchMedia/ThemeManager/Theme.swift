//
//  Theme.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 18/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

protocol Theme {
    // MARK: Common
    func showCategoryTitleLabelStyle(label: UILabel)
    func showItemTitleLabelStyle(label: UILabel)
    func showDetailTitleLabelStyle(label: UILabel)
    func showDetailDescriptionLabelStyle(label: UILabel)
    func showDetailYearLabelStyle(label: UILabel)
    func showDetailDismissButtonStyle(button: UIButton) 
}
