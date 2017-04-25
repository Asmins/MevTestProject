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

    func getObjectFromDataBase() {
        print(realm.objects(Film))
    }

}
