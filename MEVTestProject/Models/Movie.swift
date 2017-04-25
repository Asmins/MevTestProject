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

    init(_ name: String, date: String, url: String) {
        self.nameMovie = name
        self.dateMovie = date
        self.posterURL = url
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


}
