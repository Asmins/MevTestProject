//
//  DetailMovieViewModel.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

class DetailMovieViewModel {

    private var view: DetailMovieViewController?

    init(view: DetailMovieViewController) {
        self.view = view
    }

    private func checkPlaceholder(_ movie: Movie?) -> Bool {
        if movie == nil {
            return true
        } else {
            return false
        }
    }

    func showOrHiddenPlaceholder(movie: Movie?) {
        let emptyMovie = self.checkPlaceholder(movie)

        if emptyMovie {
            self.view?.showPlaceholder()
        } else {
            self.view?.showFeed()
        }
    }
}
