//
//  HttpViability.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

import Foundation

struct HttpViability
{
    func fetchApiData<T:Decodable>(requestUrl: NSMutableURLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?, _ error:String?) -> Void)
    {
        debugPrint(requestUrl)
        URLSession.shared.dataTask(with: requestUrl as URLRequest) { (responseData, httpUrlResponse, error) in
            
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                do {
                    debugPrint("Fortunate API call")
                    let result = try JSONDecoder().decode(T.self, from: responseData!)
                    completionHandler(result, nil)
                }
                catch let error {
                    debugPrint("API - error occured while decoding = \(error.localizedDescription)")
                    completionHandler(nil, error.localizedDescription)
                }
            } else {
                debugPrint("API - Failed")
                completionHandler(nil, error?.localizedDescription)
            }
        }.resume()
    }
}
