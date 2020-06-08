//
//  MedicineListPresenter.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

class MedicineListPresenter: MedicineListViewToPresenterProtocol {
    
    var view: MedicineListPresenterToViewProtocol?
    var interactor: MedicineListPresenterToInteractorProtocol?
    var router: MedicineListPresenterToRouterProtocol?
    
    func fetchMedicineList() {
        interactor?.fetchMedicineList()
    }
}

extension MedicineListPresenter: MedicineListInteractorToPresenterProtocol {
    func showMedicineListSucceed(medicines: [MedicationResponse]) {
        view?.showMedicineListSucceed(medicines: medicines)
    }
    
    func showMedicineListFailed(info: String) {
        view?.showMedicineListFailed(info: info)
    }
    
    func showMedicineEmpty(info: String) {
        view?.showMedicineEmpty(info: info)
    }
}

