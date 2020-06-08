//
//  MedicationDetailResponse.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import SwiftyJSON

class MedicationDetailResponse: GenericResponse {
    
    var id: String?
    var prescription_image: String?
    var status: String?
    var patient: Patient?
    
    required public init(json: JSON?) {
        if let json = json {
            id = json["id"].string
            prescription_image = json["prescription_image"].string
            status = json["status"].string
            patient = Patient(json: json["patient"])
        }
    }
}

class Patient {
    
    var id: Int?
    var full_name: String?
    var phone_number: String?
    
    init(json: JSON?) {
        if let json = json {
            id = json["id"].int
            full_name = json["full_name"].string
            phone_number = json["phone_number"].string
        }
    }
}

class Address {
    
    var id: String?
    var postal_code: String?
    var latitude: Double?
    var longitude: Double?
    var first_line: String?
    var second_line: String?
    var note: String?
    var province: String?
    var district: String?
    var sub_district: String?
    
    init(json: JSON?) {
        if let json = json {
            id = json["id"].string
            postal_code = json["postal_code"].string
            latitude = json["latitude"].double
            longitude = json["longitude"].double
            first_line = json["id"].string
            second_line = json["postal_code"].string
            note = json["note"].string
            province = json["province"].string
            district = json["district"].string
            sub_district = json["sub_district"].string
        }
    }
}
