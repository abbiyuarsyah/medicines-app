//
//  MedicineRouter.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

class MedicineListRouter: MedicineListPresenterToRouterProtocol {
    
    weak var view: MedicineListViewController?
    
    static func createModule() -> MedicineListViewController {
        let viewController = UIStoryboard.init(name: "MedicineList", bundle: nil).instantiateViewController(withIdentifier: "MedicineListViewController") as! MedicineListViewController
        let presenter = MedicineListPresenter()
        let router = MedicineListRouter()
        let interactor = MedicineListInteractor()
        
        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func navigateToMedicineDetail(id: String) {
        let viewController = MedicineDetailRouter.createModule()
        viewController.id = id
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

