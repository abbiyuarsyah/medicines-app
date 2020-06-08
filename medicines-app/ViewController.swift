//
//  ViewController.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickButtonNext(_ sender: Any) {
        let controller = MedicineListRouter.createModule()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

