//
//  BlackNavigationController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import UIKit
import Foundation

class BlackNavigationController: UINavigationController {
    override func awakeFromNib() {
        self.settingBlackNavController()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    fileprivate func settingBlackNavController() {
        self.navigationBar.barTintColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
}
