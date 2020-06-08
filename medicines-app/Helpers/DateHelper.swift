//
//  DateHelper.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import Foundation

class DateHelper {
    
    static public func dateFrom (_ rawDate: String?, format: String?) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = format
       
        var date: Date? = dateFormatterGet.date(from: rawDate!)
        if date == nil{
            dateFormatterGet.locale = Locale(identifier: "id_ID")
            date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        }
        return date!
    }
    
    static public func stringFrom (_ rawdate: String?, fromFormat: String?, toFormat: String?) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "id_ID")
        dateFormatterGet.dateFormat = toFormat
       
        let date = self.dateFrom(rawdate, format: fromFormat)
        let strDate: String? = dateFormatterGet.string(from: date)
        return strDate ?? ""
    }
}
