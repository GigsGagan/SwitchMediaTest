//
//  BaseViewController.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBar()
    }
    
    //MARK:- Navigation Bar and Status Bar Methods
   
    func setStatusBar() {   //Set Status Bar Color
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = UIColor(colorLiteralRed: 0.0/255.0, green: 137.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func setTitle(title:String) {   //Set Navigation Bar Title With Background Color
        self.navigationController?.isNavigationBarHidden = false
        _ = self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 0.0/255.0, green: 137.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = .zero
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.7
        self.navigationController?.navigationBar.layer.shadowRadius = 10.0
        
        let titleLabel = UILabel(frame: CGRect(x: 50, y:5, width:100, height:18))
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.textColor = .white
        self.navigationItem.titleView = titleLabel
    }
    
    func setBackButton(){ //Custom back Button
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 42, height: 36)
        backButton.setImage(#imageLiteral(resourceName: "backBtn"), for: UIControlState.normal)
        backButton .addTarget(self, action: #selector(self.backButtonAction), for: UIControlEvents.touchUpInside)
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = backButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -15;
        self.navigationItem.setLeftBarButtonItems([negativeSpacer, leftBarButton], animated: false)
    }
    
    func backButtonAction() { //back button action
        _ = self.navigationController?.popViewController(animated: true)
    }

    //MARK:- UIAlertController Method
    func showAlert(message: String){
        let alertController = UIAlertController(title: Constants.SwiftMedia, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
