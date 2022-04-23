//
//  CardViewModel.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

import Foundation

class CardViewModel {
    
    func callInfoApi(completion : @escaping (_ info: Info, _ error: String?) -> Void) {
        
        let cardResource = CardResource()
        cardResource.getInfo() { (response, error) in
            
            if(error == nil && response != nil) {
                completion(response ?? Info(), nil)
            } else {
                completion(response ?? Info(), error)
            }
        }
    }
    
    func callCardApi<T: Decodable>(resource: String, param: String, resultType: T.Type, completion : @escaping (_ result: T, _ error: String?) -> Void) {
        
        let cardResource = CardResource()
        cardResource.getCard(resource: resource, param: param.replacingOccurrences(of: " ", with: "%20"), resultType: resultType) { (response, error) in
            
            if(error == nil && response != nil) {
                completion(response!, nil)
            } else if response == nil {
                let t: [T] = []
                completion(t as! T, error)
            }
        }
    }
}
