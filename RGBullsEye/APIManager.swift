//
//  APIManager.swift
//  RGBullsEye
//
//  Created by Neosoft1 on 22/08/22.
//

import Foundation
import SwiftUI
import Combine

enum UserError: LocalizedError {
    case invalidStatusCode
    case noInternet
    case dataInImproperFormat
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidStatusCode:
            return "Invalid response code"
        case .noInternet:
            return "Please check internet availability"
        case .dataInImproperFormat:
            return "Failed to decode JSON data"
        case .custom(let error):
            return error.localizedDescription
        }
    }
}

class APIManager {
    
    func webServiceAPI() {
    let path = "https://reqres.in/api/users?page=2"
        
    let url = URL(string: path)
        
    URLSession.shared
        .dataTaskPublisher(for: url!)
        .receive(on: DispatchQueue.main)
        .tryMap ({ response in
            guard let res = response.response as? HTTPURLResponse, res.statusCode >= 200 && res.statusCode <= 300 else { throw UserError.invalidStatusCode }
            
        let jsonDecoder = JSONDecoder()
            guard let users = jsonDecoder.decode([Users.self], from: res.data) else { throw UserError.dataInImproperFormat }
            
            return users
        })
        .sink { result in
            switch result {
            case .failure(let error):
                UserError.custom(error: error)
            }
        }
        
    }
}

struct Users {
    var page: String?
    var per_page: String?
    var total: String?
    var total_pages: String?
    var data: [Data]?
}

struct Data {
    var id: Int?
    var email: String?
    var first_name: String?
    var last_name: String?
    var avatar: String?
}
