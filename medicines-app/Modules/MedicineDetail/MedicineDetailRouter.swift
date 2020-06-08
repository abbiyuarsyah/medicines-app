//
//  MedicineDetailRouter.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 09/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit
import Foundation

class MedicineDetailRouter: MedicineDetailPresenterToRouterProtocol {
    
    weak var view: MedicineDetailViewController?
    
    static func createModule() -> MedicineDetailViewController {
        let viewController = UIStoryboard.init(name: "MedicineDetail", bundle: nil).instantiateViewController(withIdentifier: "MedicineDetailViewController") as! MedicineDetailViewController
        let presenter = MedicineDetailPresenter()
        let router = MedicineDetailRouter()
        let interactor = MedicineDetailInteractor()
        
        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func showDialogError(info: String) {
        let title = "Failed"
        let alertController = UIAlertController(title: title,
                                                message: info,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) {
            UIAlert in
            self.view?.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.view?.present(alertController, animated: true, completion: nil)
    }
}

