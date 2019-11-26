//
//  DetailsViewController.swift
//  SwitchMedia
//
//  Created by Gaganpreet singh on 17/6/2017.
//  Copyright © 2017 Gaganpreet singh. All rights reserved.
//

import Foundation
import UIKit

class DetailsView : UIView {
    
    // MARK:- Variables
    var parentView : UIView = UIView()
    private let itemImageView = UIImageView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        ThemeManager.showDetailTitleLabelStyle(label: label)
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        ThemeManager.showDetailYearLabelStyle(label: label)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        ThemeManager.showDetailDescriptionLabelStyle(label: label)
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        ThemeManager.showDetailDismissButtonStyle(button: button)
        button.addTarget(self, action: #selector(hideDetailScreen), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Required Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Private Methods
    private func setConstraints() {
        
        addSubview(self.parentView)
        addSubview(self.titleLabel)
        addSubview(self.dismissButton)
        addSubview(self.itemImageView)
        addSubview(self.yearLabel)
        addSubview(self.descriptionLabel)
        
        self.parentView.backgroundColor = UIColor.white
        self.parentView.translatesAutoresizingMaskIntoConstraints = false
        self.parentView.topAnchor.constraint(equalTo: self.topAnchor,constant: 0).isActive = true
        self.parentView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0).isActive = true
        self.parentView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0).isActive = true
        self.parentView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0).isActive = true
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.parentView.topAnchor,constant: 25).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor,constant: 10).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.dismissButton.leadingAnchor,constant: -10).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        self.dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.dismissButton.topAnchor.constraint(equalTo: self.parentView.topAnchor,constant: 25).isActive = true
        self.dismissButton.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor,constant: -10).isActive = true
        self.dismissButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.dismissButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.itemImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
        self.itemImageView.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor,constant: 10).isActive = true
        self.itemImageView.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor,constant: -10).isActive = true
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            self.itemImageView.heightAnchor.constraint(equalToConstant: 610).isActive = true
        }else{
            self.itemImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true 
        }
        
        self.yearLabel.translatesAutoresizingMaskIntoConstraints = false
        self.yearLabel.topAnchor.constraint(equalTo: self.itemImageView.bottomAnchor,constant: 10).isActive = true
        self.yearLabel.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor,constant: -10).isActive = true
        self.yearLabel.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor,constant: 10).isActive = true
        self.yearLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.topAnchor.constraint(equalTo: self.yearLabel.bottomAnchor,constant: 10).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor,constant: -10).isActive = true
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor,constant: 10).isActive = true
    }
    
    private func animateView(){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.alpha = 1.0
        UIView.animate(withDuration:            0.4,
                       delay:                   0,
                       usingSpringWithDamping:  CGFloat(1),
                       initialSpringVelocity:   CGFloat(1),
                       options:                 .curveEaseInOut,
                       animations:              {self.transform = .identity},
                       completion:nil)
    }
    
    // MARK:- Handlers
    
    func showDetailScreen(item : Items ) {
        
        func allocateValues(){
            self.titleLabel.text = item.title
            self.descriptionLabel.text = item.description
            self.yearLabel.text = String(item.year!)
            
            if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
                self.itemImageView.sd_setImage(with: URL(string: (item.images?[ThumbnailType.Landscape.rawValue])!), placeholderImage: UIImage(named: "placeholder"))
            }else{
                self.itemImageView.sd_setImage(with: URL(string: (item.images?[ThumbnailType.Portrait.rawValue])!), placeholderImage: UIImage(named: "placeholder"))
            }
        }
        if let window = UIApplication.shared.keyWindow {
            self.frame = window.frame
            window.addSubview(self)
            self.alpha = 0
            animateView()
            allocateValues()
        }
    }
    
    @objc private func hideDetailScreen() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.alpha = 0.0
        }, completion: { (completion) -> Void in
            self.removeFromSuperview()
        })
    }
    
}
