//
//  MedicineListViewController.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MedicineListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var medicineList: [MedicationResponse]? = []
    
    var presenter: MedicineListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultNavigationBar()
        self.title = "Medicine List"

        setTabelView()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
        presenter?.fetchMedicineList()
    }
    
    private func setTabelView() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MedicineListTableViewCell", bundle: nil), forCellReuseIdentifier: "MedicineListTableViewCell")
    }
    
    private func goToMedicineDetail(id: String) {
        presenter?.goToMedicineDetail(id: id)
    }
}

extension MedicineListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineListTableViewCell") as! MedicineListTableViewCell
        return cell
    }
}

extension MedicineListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicineList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineListTableViewCell", for: indexPath) as! MedicineListTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        if let medicines = medicineList?[indexPath.row] {
            cell.setUpMedicine(medicines: medicines)
        }
        
        return cell
    }
}

extension MedicineListViewController: MedicineListPresenterToViewProtocol {
    func showMedicineListSucceed(medicines: [MedicationResponse]) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        medicineList = medicines
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func showMedicineListFailed(info: String) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        presenter?.showDialogError(info: info)
    }
}

extension MedicineListViewController: MedicineListCellDelegate {
    func buttonTapped(cell: MedicineListTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        if let id = medicineList?[indexPath.row].id {
            self.goToMedicineDetail(id: "\(id)")
        }
    }
}

