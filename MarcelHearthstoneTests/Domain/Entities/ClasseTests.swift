//
//  ClasseTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class ClasseTests: XCTestCase, DecodableTestCase {
    
    var sut: Classe?
    
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
        let card1 = Card(img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/278d61e6c3f9054bfb59af11ebaba8d31a6d7ce016ed1dcf2b826d79056bcfe5.png")
        let card2 = Card(img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/278d61e6c3f9054bfb59af11ebaba8d31a6d7ce016ed1dcf2b826d79056bcfe5.png")
        XCTAssertEqual(card1, card2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let card1 = Card(img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/c5d4f7b7229099f6459b7da3590b5e45e818667d1fca976575191c4420e0135f.png")
        let card2 = Card(img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/278d61e6c3f9054bfb59af11ebaba8d31a6d7ce016ed1dcf2b826d79056bcfe5.png")
        XCTAssertNotEqual(card1, card2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/faccebeea1dbcf52a13f5cc74ef12d5d9047becc04deec204b61a990f7d01606.png")
    }
}
