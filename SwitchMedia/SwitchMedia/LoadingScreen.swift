//
//  LoadingScreen.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 16/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import PromiseKit

class LoadingScreen : UIView {
    
    // MARK:- Outlets
    var loadingIndicatorContainerView : UIView = UIView()
    var loadingIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK:- Required initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Private Methods
    private func setup() {
        addSubview(loadingIndicatorContainerView)
        addSubview(loadingIndicator)
        
        self.loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        self.loadingIndicator.tintColor = UIColor.red
        self.loadingIndicatorContainerView.backgroundColor = UIColor(colorLiteralRed: 0.0/255.0, green: 137.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        self.loadingIndicatorContainerView.layer.cornerRadius = 10
        self.loadingIndicatorContainerView.layer.masksToBounds = true
        self.setConstraints()
    }
    
    private func setConstraints() {
        
        self.loadingIndicatorContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIndicatorContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.loadingIndicatorContainerView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.loadingIndicatorContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.loadingIndicatorContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.loadingIndicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.loadingIndicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // MARK:- Handlers
    
    func showLoadingScreen() {
        if let window = UIApplication.shared.keyWindow {
            self.frame = window.frame
            window.addSubview(self)
        }
        
        loadingIndicator.startAnimating()
        self.alpha = 0
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.alpha = 1.0
        }
    }
    
    func hideLoadingScreen() {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.alpha = 0.0
        }, completion: { (completion) -> Void in
            self.loadingIndicator.stopAnimating()
            self.removeFromSuperview()
        })
    }
    
}
