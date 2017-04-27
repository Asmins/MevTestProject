//
//  Protocols.swift
//  MEVTestProject
//
//  Created by Asmins on 27.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

protocol AtionFromViewController {
    func showAlertWith(_ text: String)
    func openDetailViewController(_ movie: Movie?)
    func showActivityView()
    func hiddenActivityView()
}

protocol HistoryAction {
    func openFeedScreen(_ movie: Movie)
}

