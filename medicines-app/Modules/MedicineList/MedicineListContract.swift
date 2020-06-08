//
//  MedicineListContract.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

protocol MedicineListPresenterToRouterProtocol: class {
    static func createModule() -> MedicineListViewController
}

protocol MedicineListPresenterToViewProtocol: class {
    func showMedicineListSucceed(medicines: [MedicationResponse])
    func showMedicineListFailed(info: String)
    func showMedicineEmpty(info: String)
}

protocol MedicineListPresenterToInteractorProtocol: class {
    var presenter: MedicineListInteractorToPresenterProtocol? { get set }
    
    func fetchMedicineList()
}

protocol MedicineListInteractorToPresenterProtocol: class {
    func showMedicineListSucceed(medicines: [MedicationResponse])
    func showMedicineListFailed(info: String)
    func showMedicineEmpty(info: String)
}

protocol MedicineListViewToPresenterProtocol: class {
    var view: MedicineListPresenterToViewProtocol? { get set }
    var interactor: MedicineListPresenterToInteractorProtocol? { get set }
    var router: MedicineListPresenterToRouterProtocol? { get set }
    
    func fetchMedicineList()
}
