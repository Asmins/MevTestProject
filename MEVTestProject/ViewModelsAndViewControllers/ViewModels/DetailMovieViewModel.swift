//
//  DetailMovieViewModel.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

class DetailMovieViewModel {

    private func checkPlaceholder(_ movie: Movie?) -> Bool {
        if movie == nil {
            return true
        } else {
            return false
        }
    }

    func showOrHiddenPlaceholder(movie: Movie?, firstAction: (Void) ->(),secondAction:(Void) ->() ) {
        let emptyMovie = self.checkPlaceholder(movie)

        if emptyMovie {
            firstAction()
        } else {
            secondAction()
        }
    }
}
