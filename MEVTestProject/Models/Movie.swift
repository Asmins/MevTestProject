//
//  Movie.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

class Movie {
    private var nameMovie: String!
    private var dateMovie: String!
    private var posterURL: String!
    private var genre: String!
    private var infoAbout: String!
    private var actors: String!

    init(_ name: String, date: String, url: String, genre: String, info: String, actors: String) {
        self.nameMovie = name
        self.dateMovie = date
        self.posterURL = url
        self.genre = genre
        self.infoAbout = info
        self.actors = actors
    }

    func getNameMovie() -> String {
        return self.nameMovie
    }

    func getDateMovie() -> String {
        return self.dateMovie
    }

    func getPosterURl() -> String {
        return self.posterURL
    }

    func getGenre() -> String {
        return self.genre
    }

    func getInfo() -> String {
        return self.infoAbout
    }

    func getActors() -> String {
        return self.actors
    }
}
