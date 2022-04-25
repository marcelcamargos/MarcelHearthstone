//
//  CardViewModel.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

import Foundation

class MainViewModel {
    
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
}
