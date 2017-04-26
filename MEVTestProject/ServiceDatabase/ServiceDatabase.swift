//
//  ServiceDatabase.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import UIKit
import RealmSwift
import Foundation

class ServiceDatabase {
    let realm = try! Realm()

    private let request = Request()
    private let film = Film()

    private func createObjectFilm(_ movie: Movie) {
        self.film.titleFilm = movie.getNameMovie()
        self.film.dateReleased = movie.getDateMovie()
        self.film.posterURL = movie.getPosterURl()
        self.film.genre = movie.getGenre()
        self.film.actors = movie.getActors()
        self.film.infoAbout = movie.getInfo()
    }

    private func createObjectRequest(_ textRequest: String) {
        self.request.title = textRequest
        self.request.film = self.film
    }

    private func appendInDataBase() {
        try! realm.write {
            realm.add(self.request)
        }
    }

    func appenNewObjectsdDataBase(_ textRequest: String, movie: Movie) {
        self.createObjectFilm(movie)
        self.createObjectRequest(textRequest)
        self.appendInDataBase()
    }

    func searchSampleRequestInDataBase(_ textRequest: String) -> Movie? {
        let historyRequests = self.getHistoryRequests()

        if historyRequests.contains(textRequest) {
            let index = historyRequests.index(of: textRequest)
            let request = realm.objects(Request.self)
            let movieFromDataBase: Film = request[index!].film!
            return Movie(movieFromDataBase.titleFilm, date: movieFromDataBase.dateReleased,
                         url: movieFromDataBase.posterURL,genre: movieFromDataBase.genre,
                         info: movieFromDataBase.infoAbout, actors: movieFromDataBase.actors)
        } else {
            return nil
        }
    }

    private func getHistoryRequests() -> [String] {
        var arrayResult = [String]()
        let historyRequest = realm.objects(Request.self)
        for value in historyRequest {
            arrayResult.append(value.title)
        }
        return arrayResult
    }


//    func getObjectFromDataBase() -> [String] {
//        let historyRequest = realm.objects(Request)
//        for value in historyRequest {
//            print(value.title)
//        }
//    }

}
