//
//  HistorySearchViewController.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class HistorySearchViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var viewModel:HistorySearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HistorySearchViewModel(self)
        self.viewModel?.getHistoryRequest()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.getHistoryRequest()
        tableView.reloadData()
    }
}

extension HistorySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.result?[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel!.result?.count == 0 {
            self.showPlaceHolder()
            return 0
        } else {
            self.showTableView()
            return (viewModel!.result?.count)!
        }
    }
}

extension HistorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.openDetailScreen(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HistorySearchViewController {
    func openDetailViewController(_ movie: Movie) {
        let controller = self.tabBarController?.viewControllers?[1] as! DetailMovieViewController
        controller.movie = movie
        self.tabBarController?.selectedIndex = 1
    }

    func showTableView() {
        tableView.isHidden = false
        placeholderView.isHidden = true
    }

    func showPlaceHolder() {
        tableView.isHidden = true
        placeholderView.isHidden = false
    }
}
