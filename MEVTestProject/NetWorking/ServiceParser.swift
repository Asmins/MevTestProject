//
//  ServiceParser.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

protocol TransferResult {
    func transfer(movie: Movie?)
}

class ServiceParser {
    var delegate: TransferResult!

    var movie: Movie?

    func parsResult(_ data: Data) {
        let json = JSON(data: data)
        let error = json["Error"].stringValue 

        if error != "" {
            delegate.transfer(movie: nil)
        } else {
            let urlPoster = json["Poster"].stringValue
            let released = json["Released"].stringValue
            let title = json["Title"].stringValue
            movie = Movie(title, date: released, url: urlPoster)
            delegate.transfer(movie: movie!)
        }
    }
}
