//
//  CardResource.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

import Foundation
import UIKit

class CardResource
{
    func getInfo(completion: @escaping (_ result: Info?, _ error: String?) -> Void)
    {
        let request = NSMutableURLRequest(url: NSURL(string: APIEndpoints.infoURL)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIEndpoints.headers
        
        let httpViability = HttpViability()
        
        httpViability.fetchApiData(requestUrl: request, resultType: Info.self) { (response, error)  in
            _ = completion(response, error)
        }
    }
    
    func getCard<T: Decodable>(resource: String, param: String, resultType: T.Type, completion: @escaping (_ result: T?, _ error: String?) -> Void)
    {
        print(APIEndpoints(resource: resource, param: param).cardURL)
        let request = NSMutableURLRequest(url: NSURL(string: APIEndpoints(resource: resource, param: param).cardURL)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIEndpoints.headers
        
        let httpViability = HttpViability()
        
        httpViability.fetchApiData(requestUrl: request, resultType: resultType) { (response, error)  in
            completion(response, error)
        }
    }
}
