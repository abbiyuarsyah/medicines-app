//
//  MedicineListTableViewCell.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

protocol MedicineListCellDelegate: class {
    func buttonTapped(cell: MedicineListTableViewCell)
}

class MedicineListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelOrderNumber: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    weak var delegate: MedicineListCellDelegate?
    
    func setUpMedicine(medicines: MedicationResponse) {
        viewCell.addBorderWithRadiusAndShadow()
        labelName.text = medicines.full_name
        labelOrderNumber.text = "#\(medicines.id ?? 0)"
        labelDate.text = DateHelper.stringFrom(medicines.updated_at, fromFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "dd-MMM-yyyy, HH:mm")
        
        let status = medicines.status
        labelStatus.text = medicines.status
        switch status {
        case "Active":
            labelStatus.textColor = .green
        case "Prescription Rejected":
            labelStatus.textColor = .orange
        case "In Review":
            labelStatus.textColor = .purple
        default:
            labelStatus.textColor = .black
        }
        
        var currency = medicines.currency
        if currency == "IDR" {
            currency = "Rp"
        } else {
            currency = "-"
        }
        
        if let price = medicines.total_price {
            labelPrice.text = "\(currency ?? "-") \(AppFormatter.formatNumber(value: price))"
        } else {
            labelPrice.text = currency
        }
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.goToMedicineDetail))
        viewCell.addGestureRecognizer(gesture)
    }
    
    @objc func goToMedicineDetail(sender : UITapGestureRecognizer) {
        self.delegate?.buttonTapped(cell: self)
    }
}
