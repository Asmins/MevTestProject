//
//  Router.swift
//  MEVTestProject
//
//  Created by Asmins on 27.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import Foundation

class Router {
    func openDetailViewController(_ movie: Movie, viewController: UIViewController) {
        let controller = viewController.tabBarController?.viewControllers?[1] as! DetailMovieViewController
        controller.movie = movie
        viewController.tabBarController?.selectedIndex = 1
    }
}
