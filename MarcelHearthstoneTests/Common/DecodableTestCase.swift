//
//  DecodableTestCase.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import Foundation
import XCTest

protocol DecodableTestCase: AnyObject {
    associatedtype T: Decodable
    var sut: T? { get set }
}

extension DecodableTestCase {
    func givenSUTFromJSON(fileName: String = "\(T.self)") throws {
        do {
            let decoder = JSONDecoder()
            let data = try Data.fromJSON(fileName: fileName)
            sut = try decoder.decode(T.self, from: data)
        } catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError)")
        }
    }
}
