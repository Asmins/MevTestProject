//
//  ServiceRequest.swift
//  MEVTestProject
//
//  Created by Asmins on 25.04.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

protocol RequestServiceProtocol {
    func sendRequest(_ stringURL: String, method:HTTPMethod, parameters: [String:Any], headers: [String: String], result:@escaping (_ data:Data?, _ error: Error?) -> Void)
}

class ServiceRequest {
//If will we have more than one request in this class we have all request for get data from server
    func sendRequestForGetMovie(parameters: [String: Any], headers: [String: String],result:@escaping (_ data:Data?, _ error: Error?) -> Void) {
        self.sendRequest("http://omdbapi.com", method: .get, parameters: parameters, headers: headers, result: result)
    }
}

extension ServiceRequest: RequestServiceProtocol {
   func sendRequest(_ stringURL: String, method: HTTPMethod, parameters: [String : Any], headers: [String : String], result: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(stringURL, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                return result(response.data, nil)
            case .failure(let error):
                print(error)
                return result(nil, error)
            }
        })
    }
}
