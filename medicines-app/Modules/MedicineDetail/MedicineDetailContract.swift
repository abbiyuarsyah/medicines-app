//
//  MedicineDetailContract.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

protocol MedicineDetailPresenterToRouterProtocol: class {
    static func createModule() -> MedicineDetailViewController
    
    func showDialogError(info: String)
}

protocol MedicineDetailPresenterToViewProtocol: class {
    func showMedicineDetailSucceed(medicineDetail: MedicationDetailResponse)
    func showMedicineDetailFailed(info: String)
}

protocol MedicineDetailPresenterToInteractorProtocol: class {
    var presenter: MedicineDetailInteractorToPresenterProtocol? { get set }
    
    func fetchMedicineDetail(id: String)
}

protocol MedicineDetailInteractorToPresenterProtocol: class {
    func showMedicineDetailSucceed(medicineDetail: MedicationDetailResponse)
    func showMedicineDetailFailed(info: String)
}

protocol MedicineDetailViewToPresenterProtocol: class {
    var view: MedicineDetailPresenterToViewProtocol? { get set }
    var interactor: MedicineDetailPresenterToInteractorProtocol? { get set }
    var router: MedicineDetailPresenterToRouterProtocol? { get set }
    
    func fetchMedicineDetail(id: String)
    func showDialogError(info: String)
}
