//
//  MedicineResponse.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import SwiftyJSON

class MedicationResponse: GenericResponse {
    
    var id: String?
    var status: String?
    var full_name: String?
    var total_price: String?
    var currency: String?
    var updated_at: String?
    
    required public init(json: JSON?) {
        if let json = json {
            id = json["id"].string
            status = json["status"].string
            full_name = json["full_name"].string
            total_price = json["total_price"].string
            currency = json["currency"].string
            updated_at = json["updated_at"].string
        }
    }
}
  
