//
//  MedicineDetailViewController.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class MedicineDetailViewController: UIViewController {

    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var viewPersonalInfo: UIView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelStatusDescription: UILabel!
    @IBOutlet weak var labelOrderNumber: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var imageViewPrescription: UIImageView!
    
    var id: String?
    var presenter: MedicineDetailViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultNavigationBar()
        self.title = "Medicine Detail"
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
        presenter?.fetchMedicineDetail(id: id ?? "0")
    }
    
    private func setViewData(medicineDetail: MedicationDetailResponse) {
        viewStatus.addBorderWithRadiusAndShadow()
        viewPersonalInfo.addBorderWithRadiusAndShadow()
        viewImage.addBorderWithRadiusAndShadow()
        labelOrderNumber.text = "#\(medicineDetail.id ?? "-")"
        labelName.text = medicineDetail.patient?.full_name
        labelPhoneNumber.text = medicineDetail.patient?.phone_number
        labelAddress.text = "\(medicineDetail.address?.first_line ?? "-"), \(medicineDetail.address?.second_line ?? "-"), \n\(medicineDetail.address?.sub_district ?? "-")  \(medicineDetail.address?.district ?? "-"),  \(medicineDetail.address?.province ?? "-"), \n\(medicineDetail.address?.postal_code ?? "-")"

        let status = medicineDetail.status
        labelStatus.text = medicineDetail.status
        switch status {
        case "Active":
            labelStatusDescription.text = "Congrats!, your prescription is actived"
            labelStatus.textColor = .green
        case "Prescription Rejected":
            labelStatusDescription.text = "We are sorry, your prescription is rejected"
            labelStatus.textColor = .orange
        case "In Review":
            labelStatusDescription.text = "We are currently reviewing your prescription"
            labelStatus.textColor = .purple
        default:
            labelStatus.textColor = .black
        }
        
        imageViewPrescription.sd_setImage(with: URL(string: medicineDetail.prescription_image ?? ""))
    }
}

extension MedicineDetailViewController: MedicineDetailPresenterToViewProtocol {
    func showMedicineDetailSucceed(medicineDetail: MedicationDetailResponse) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        self.setViewData(medicineDetail: medicineDetail)
    }
    
    func showMedicineDetailFailed(info: String) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        presenter?.showDialogError(info: info)
    }
}
