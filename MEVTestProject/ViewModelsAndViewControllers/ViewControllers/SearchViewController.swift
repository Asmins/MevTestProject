//
//  SearchViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    fileprivate var viewModel: SearchViewModel?
    @IBOutlet weak var nameMovieTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(self)
        //self.viewModel?.sendMovieRequest("Harry Potter and Deathly Hallows")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.setCustomTitle(self)
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
}
