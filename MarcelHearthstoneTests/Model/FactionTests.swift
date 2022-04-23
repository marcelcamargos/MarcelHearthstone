//
//  FactionTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class FactionTests: XCTestCase, DecodableTestCase {
    
    var sut: Faction?
    
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
        let faction1 = Faction(name: "Abusive Sergeant", faction: "Alliance", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/7e1cf5550e461e7b3593afe17c04289f859cdbb19214eb8f01419dbd17bc70ae.png")
        let faction2 = Faction(name: "Abusive Sergeant", faction: "Alliance", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/7e1cf5550e461e7b3593afe17c04289f859cdbb19214eb8f01419dbd17bc70ae.png")
        XCTAssertEqual(faction1, faction2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let faction1 = Faction(name: "Abusive Sergeant", faction: "", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/7e1cf5550e461e7b3593afe17c04289f859cdbb19214eb8f01419dbd17bc70ae.png")
        let faction2 = Faction(name: "Abusive Sergeant", faction: "Alliance", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/7e1cf5550e461e7b3593afe17c04289f859cdbb19214eb8f01419dbd17bc70ae.png")
        XCTAssertNotEqual(faction1, faction2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/7e1cf5550e461e7b3593afe17c04289f859cdbb19214eb8f01419dbd17bc70ae.png")
    }
}
