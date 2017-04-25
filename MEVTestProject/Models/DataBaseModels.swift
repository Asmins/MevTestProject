//
//  ModelMovieForDataBase.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import UIKit
import Foundation
import RealmSwift

class Request: Object {
    dynamic var title = ""
    dynamic var film: Film?

}

class Film: Object {
    dynamic var titleFilm = ""
    dynamic var dateReleased = ""
    dynamic var posterURL = ""
    dynamic var genre = ""
    dynamic var infoAbout = ""
    dynamic var actors = ""

}
