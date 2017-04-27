//
//  SearchViewModel.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

protocol AtionFromViewController {
    func showAlertWith(_ text: String)
    func openDetailViewController(_ movie: Movie?)
    func showActivityView()
    func hiddenActivityView()
}

class SearchViewModel {
    private var requestService = ServiceRequest()
    private var parserService = ServiceParser()
    //private var view: SearchViewController!
    fileprivate let serviceDataBase = ServiceDatabase()

    fileprivate var textRequest: String?

    var delegate: AtionFromViewController?

    init() {
        self.parserService.delegate = self
    }

    func sendMovieRequest(_ title: String) {
        delegate?.showActivityView()
        let serviceBD = ServiceDatabase()
        let movie = serviceBD.searchSampleRequestInDataBase(title)
        if movie != nil {
            self.delegate?.openDetailViewController(movie!)
        } else {
            let empty = self.checkToEmpty(title)
            if empty  {
                let parameters: [String: Any] = ["t": title,
                                                 "apikey":"67996ced",
                                                 "page":10,
                                                 "r": "json"]
                self.requestService.sendRequestForGetMovie(parameters: parameters, headers: [:], result: {( data, error ) in
                    self.delegate?.hiddenActivityView()
                    if data != nil {
                        self.parserService.parsResult(data!)
                    } else {
                        self.delegate?.showAlertWith((error?.localizedDescription)!)
                    }
                })
            } else {
                self.delegate?.showAlertWith("Empty name of movie")
            }
        }
    }

    fileprivate func checkToEmpty(_ title: String) -> Bool {
        if title == "" {
            return false
        } else {
            self.textRequest = title
            return true
        }
    }
}

extension SearchViewModel: TransferResult {
    func transfer(movie: Movie?) {
        if movie != nil {
            self.serviceDataBase.appenNewObjectsdDataBase(textRequest!, movie: movie!)
            self.delegate?.openDetailViewController(movie!)
        } else {
            self.delegate?.showAlertWith("Movie not found!")
        }
    }
}
