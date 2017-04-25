//
//  SearchViewModel.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

class SearchViewModel {
    private var requestService = ServiceRequest()
    private var parserService = ServiceParser()
    private var view: SearchViewController!

    init(_ view: SearchViewController) {
        self.view = view
        self.parserService.delegate = self
    }

    func sendMovieRequest(_ title: String) {
        let parameters: [String: Any] = ["t": title,
                                         "apikey":"67996ced",
                                         "page":10,
                                         "r": "json"]
        self.requestService.sendRequestForGetMovie(parameters: parameters, headers: [:], result: {( data, error ) in
            if data != nil {
                self.parserService.parsResult(data!)
            } else {
                self.view.showAlertWith((error?.localizedDescription)!)
            }
        })
    }

}

extension SearchViewModel: TransferResult {
    func transfer() {
        print("saf")
    }
}
