//
//  MedicineDetailInteractor.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

class MedicineDetailInteractor: MedicineDetailPresenterToInteractorProtocol {
    
    var presenter: MedicineDetailInteractorToPresenterProtocol?
    
    func fetchMedicineDetail(id: String) {
        BaseApi.instance.request(ApiMedications.fetchMedicationDetail(id: id), success: { (json) in
            if let value = json {
                let response = MedicationDetailResponse(json: value)
                self.presenter?.showMedicineDetailSucceed(medicineDetail: response)
            } else {
                self.presenter?.showMedicineDetailFailed(info: "Terjadi kesalahan")
            }
        }) { (error) in
            self.presenter?.showMedicineDetailFailed(info: "\(String(describing: error))")
        }
    }
}

