//
//  MedicineListInteractor.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import Alamofire

class MedicineListInteractor: MedicineListPresenterToInteractorProtocol{

    var presenter: MedicineListInteractorToPresenterProtocol?
    
    func fetchMedicineList() {
        BaseApi.instance.request(ApiMedications.fetchMedicationList, success: { (json) in
        var medicineList = [MedicationResponse]()
            if let arrayJSON = json?.array {
              medicineList = arrayJSON.map({return MedicationResponse(json: $0)})
            }
    
            if (medicineList.count > 0) {
                self.presenter?.showMedicineListSucceed(medicines: medicineList)
            } else if (medicineList.count == 0) {
                self.presenter?.showMedicineEmpty(info: "Medicine is not available")
            } else {
                self.presenter?.showMedicineListFailed(info: "Terjadi kesalahan")
            }
        }) { (error) in
            self.presenter?.showMedicineListFailed(info: "\(String(describing: error))")
        }
    }
}
