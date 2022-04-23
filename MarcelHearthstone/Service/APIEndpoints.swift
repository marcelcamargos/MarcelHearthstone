//
//  APIEndpoints.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

import Foundation

struct APIEndpoints {
    
    static let headers = [
        "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com",
        "X-RapidAPI-Key": "f35dc6bc9dmsh0460f0ecd26f596p1e8b5bjsnb99a9246dfc9"
    ]
    
    static let infoURL: String = "https://omgvamp-hearthstone-v1.p.rapidapi.com/info"
    
    let cardURL: String?
    
    init(resource: String, param: String) {
        
        self.cardURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/\(resource)/\(param)"
    }
}
