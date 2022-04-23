//
//  FactionTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class QualityTests: XCTestCase, DecodableTestCase {
    
    var sut: Quality?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        try? givenSUTFromJSON()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testConformsToDecodable() {
        XCTAssertTrue((sut as Any) is Decodable) // cast silences a warning
    }
    
    func testConformsToEquatable() {
        XCTAssertEqual(sut, sut) // requires Equatable conformance
    }
    
    func testInit_WhenGivenValues_CheckIfEqual() {
        let quality1 = Quality(name: "Avatar of the Coin", rarity: "Free", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/420a6028513a6c4793600247cad123a2e5b77aaaa99459d2f286a57e38703986.png")
        let quality2 = Quality(name: "Avatar of the Coin", rarity: "Free", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/420a6028513a6c4793600247cad123a2e5b77aaaa99459d2f286a57e38703986.png")
        XCTAssertEqual(quality1, quality2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let quality1 = Quality(name: "Avatar of the Coin", rarity: "", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/420a6028513a6c4793600247cad123a2e5b77aaaa99459d2f286a57e38703986.png")
        let quality2 = Quality(name: "Avatar of the Coin", rarity: "Free", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/420a6028513a6c4793600247cad123a2e5b77aaaa99459d2f286a57e38703986.png")
        XCTAssertNotEqual(quality1, quality2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/420a6028513a6c4793600247cad123a2e5b77aaaa99459d2f286a57e38703986.png")
    }
}
