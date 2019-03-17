//  UIView + AutoLayout.swift
//  TakeHome
//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

extension UIView {
    
    // MARK: AutoLayout
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setLeadTrailAnchor(leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingLead: CGFloat, paddingTrail: CGFloat) {
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLead).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: paddingTrail).isActive = true
        }
    }
    
    func setCenterAnchors(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, paddingCenterX: CGFloat, paddingCenterY: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
}
