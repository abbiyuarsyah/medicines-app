//
//  AppFormatter.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import Foundation

struct AppFormatter {
    
    fileprivate static var decimalFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
      
      formatter.groupingSeparator = "."
      formatter.numberStyle = .decimal
      
      return formatter
    }()
    
    static func formatNumber(value: Int) -> String {
      return decimalFormatter.string(from: NSNumber(value: value))!
    }
}
