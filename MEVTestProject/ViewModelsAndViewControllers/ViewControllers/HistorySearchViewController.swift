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

    var router = Router()
    var viewModel = HistorySearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.getHistoryRequest()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.getHistoryRequest()
        tableView.reloadData()
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

extension HistorySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.result?[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.result?.count == 0 {
            self.showPlaceHolder()
            return 0
        } else {
            self.showTableView()
            return (viewModel.result?.count)!
        }
    }
}

extension HistorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.openDetailScreen(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HistorySearchViewController: HistoryAction {
    func openFeedScreen(_ movie: Movie) {
        self.router.openDetailViewController(movie, viewController: self)
    }
}
