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

    fileprivate var viewModel: SearchViewModel?

    @IBOutlet weak var nameMovieTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(self)
        print("PATH WHERE YOU CAN FIND FILES BD \(Realm.Configuration.defaultConfiguration.fileURL!)")
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

    func openDetailViewController(_ movie: Movie) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailMovieViewController
        controller.getMovie(movie)
        self.tabBarController?.selectedIndex = 1
    }
}
