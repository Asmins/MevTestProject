//
//  HistorySearchViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class HistorySearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.setCustomTitle(self)
    }

}
