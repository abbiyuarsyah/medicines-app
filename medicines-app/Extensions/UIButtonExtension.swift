//
//  UIButtonExtension.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

extension UIButton {
    
    func roundedButtonWithShadow(radius: Float) {
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.16
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.cornerRadius = CGFloat(radius)
    }
}
