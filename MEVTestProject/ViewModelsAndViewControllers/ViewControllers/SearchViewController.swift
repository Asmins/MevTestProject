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
        print(Realm.Configuration.defaultConfiguration.fileURL)

//        let request = Request()
//        let film = Film()
//        film.titleFilm = "New Title"
//        film.dateReleased = "Today"
//        film.posterURL = "Some"
//        request.title = "New Title"
//        request.film = film
//        let realm = try! Realm()
//
//        try! realm.write {
//            realm.add(request)
//        }
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

    func openDetailViewController(_ movie: Movie) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailMovieViewController
        controller.getMovie(movie)
        self.tabBarController?.selectedIndex = 1
    }
}
