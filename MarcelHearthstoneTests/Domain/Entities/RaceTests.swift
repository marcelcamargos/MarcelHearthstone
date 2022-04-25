//
//  FactionTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class RaceTests: XCTestCase, DecodableTestCase {
    
    var sut: Race?
    
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
        let race1 = Race(name: "Cookie, the Cook", race: "Murloc", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f676ddac53c268027ece1fe84a90a8dc645296c01ff7beac64fb856c78cd02f7.png")
        let race2 = Race(name: "Cookie, the Cook", race: "Murloc", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f676ddac53c268027ece1fe84a90a8dc645296c01ff7beac64fb856c78cd02f7.png")
        XCTAssertEqual(race1, race2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let race1 = Race(name: "Cookie, the Cook", race: "", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f676ddac53c268027ece1fe84a90a8dc645296c01ff7beac64fb856c78cd02f7.png")
        let race2 = Race(name: "Cookie, the Cook", race: "Murloc", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f676ddac53c268027ece1fe84a90a8dc645296c01ff7beac64fb856c78cd02f7.png")
        XCTAssertNotEqual(race1, race2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f676ddac53c268027ece1fe84a90a8dc645296c01ff7beac64fb856c78cd02f7.png")
    }
}
