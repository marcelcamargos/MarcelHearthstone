//
//  APIEndpointsTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class APIEndpointsTests: XCTestCase {

    private let resource = "classes"
    private let param = "Death Knight"
    
    func testApodURL() throws {
        let apiURL = APIEndpoints(resource: resource, param: param.replacingOccurrences(of: " ", with: "%20")).cardURL
        let testURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/\(resource)/\(param.replacingOccurrences(of: " ", with: "%20"))"
        XCTAssertEqual(apiURL, testURL)
    }
}
