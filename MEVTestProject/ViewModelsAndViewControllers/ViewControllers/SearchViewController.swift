//
//  SearchViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import RealmSwift

class SearchViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var projectVIew: UIView!

    //IBOutlet for show when send request, Fisty
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var placeholderLabel: UILabel!
    // End

    fileprivate var viewModel: SearchViewModel?

    @IBOutlet weak var nameMovieTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(self)
        self.hiddenActivityIndicator()
        print("PATH WHERE YOU CAN FIND FILES BD \(Realm.Configuration.defaultConfiguration.fileURL!)")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.setCustomTitle(self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.nameMovieTextField.text = ""
    }

    @IBAction func searchMovieTap(_ sender: Any) {
        self.viewModel?.sendMovieRequest(nameMovieTextField.text!)
    }

}

extension SearchViewController {
    func showAlertWith(_ text: String) {
        let alertController = AlertController().showAlertWith(text)
        self.present(alertController, animated: true, completion: nil)
    }

    func showActivityIndicator() {
        searchButton.isHidden = true
        projectVIew.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        placeholderLabel.isHidden = false
    }

    func hiddenActivityIndicator() {
        searchButton.isHidden = false
        projectVIew.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        placeholderLabel.isHidden = true
    }

    func openDetailViewController(_ movie: Movie) {
        let controller = self.tabBarController?.viewControllers?[1] as! DetailMovieViewController
        controller.movie = movie
        self.tabBarController?.selectedIndex = 1
    }
}
