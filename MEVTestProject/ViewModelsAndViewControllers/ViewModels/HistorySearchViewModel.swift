//
//  HistorySearchViewModel.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import RealmSwift
import Foundation

class HistorySearchViewModel {

    var view: HistorySearchViewController?
    var result: Results<Request>?
    let serviceDataBase = ServiceDatabase()

    init(_ view: HistorySearchViewController) {
        self.view = view
    }

    func getHistoryRequest() {
        let historyRequests = serviceDataBase.getObjectFromDataBase()
        result = historyRequests
    }

    func openDetailScreen(indexPath: IndexPath) {
        let objectFromBD = result?[indexPath.row].film
        let movie = Movie((objectFromBD?.titleFilm)!, date: (objectFromBD?.dateReleased)!,
                          url: (objectFromBD?.posterURL)!, genre: (objectFromBD?.genre)!,
                          info: (objectFromBD?.infoAbout)!, actors: (objectFromBD?.actors)!)
        self.view?.openDetailViewController(movie)
    }
}
