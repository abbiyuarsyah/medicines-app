//
//  UIViewExtension.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBorderWithRadiusAndShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.12
        layer.cornerRadius = 8
        layer.masksToBounds = false
    }
}

