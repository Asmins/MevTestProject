//
//  TabBarController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

extension UITabBarController {
    func setCustomTitle(_ viewController: UIViewController) {
        viewController.tabBarController?.navigationItem.title = viewController.tabBarItem.title!
    }
}
