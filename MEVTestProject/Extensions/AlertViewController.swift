//
//  AlertViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import Foundation

class AlertController {
    func showAlertWith(_ text: String) -> UIAlertController {
        let alertController = UIAlertController(title: "", message: text, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okButton)
        return alertController
    }
}
