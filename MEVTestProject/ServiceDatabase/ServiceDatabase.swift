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
    private let request = Request()
    private let film = Film()

    private func createObjectFilm(_ movie: Movie) {
        self.film.titleFilm = movie.getNameMovie()
        self.film.dateReleased = movie.getDateMovie()
        self.film.posterURL = movie.getPosterURl()
    }

    private func createObjectRequest(_ textRequest: String) {
        self.request.title = textRequest
        self.request.film = self.film
    }

    private func appendInDataBase() {
        let realm = try! Realm()

        try! realm.write {
            realm.add(self.request)
        }
    }

    func appenNewObjectsdDataBase(_ textRequest: String, movie: Movie) {
        self.createObjectFilm(movie)
        self.createObjectRequest(textRequest)
        self.appendInDataBase()
    }

}
