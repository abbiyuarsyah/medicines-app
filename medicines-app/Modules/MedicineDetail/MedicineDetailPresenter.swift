//
//  MedicineDetailPresenter.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

class MedicineDetailPresenter: MedicineDetailViewToPresenterProtocol {
    
    var view: MedicineDetailPresenterToViewProtocol?
    var interactor: MedicineDetailPresenterToInteractorProtocol?
    var router: MedicineDetailPresenterToRouterProtocol?
    
    func fetchMedicineDetail(id: String) {
        interactor?.fetchMedicineDetail(id: id)
    }
    
    func showDialogError(info: String) {
        router?.showDialogError(info: info)
    }
}

extension MedicineDetailPresenter: MedicineDetailInteractorToPresenterProtocol {
    func showMedicineDetailSucceed(medicineDetail: MedicationDetailResponse) {
        view?.showMedicineDetailSucceed(medicineDetail: medicineDetail)
    }
    
    func showMedicineDetailFailed(info: String) {
        view?.showMedicineDetailFailed(info: info)
    }
}
