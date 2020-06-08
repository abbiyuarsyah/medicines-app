//
//  MedicineListTableViewCell.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

class MedicineListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelOrderNumber: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    func setUpMedicine(medicines: MedicationResponse) {
        labelName.text = medicines.full_name
    }
}
