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
    func transfer()
}

class ServiceParser {
    var delegate: TransferResult!

    func parsResult(_ data: Data) {
        let json = JSON(data: data)
        print(json)
    }
}
