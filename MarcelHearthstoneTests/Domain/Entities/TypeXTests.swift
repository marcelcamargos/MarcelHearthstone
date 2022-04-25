//
//  SetX.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class TypeXTests: XCTestCase, DecodableTestCase {
    
    var sut: TypeX?
    
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
        let typex1 = TypeX(name: "A. F. Kay", type: "Hero", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/4fb9aa0db87d27429255ecce8937828e8f0b3a06f3ef30c6017df625ae457a87.png")
        let typex2 = TypeX(name: "A. F. Kay", type: "Hero", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/4fb9aa0db87d27429255ecce8937828e8f0b3a06f3ef30c6017df625ae457a87.png")
        XCTAssertEqual(typex1, typex2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let typex1 = TypeX(name: "Khadgar", type: "", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/4fb9aa0db87d27429255ecce8937828e8f0b3a06f3ef30c6017df625ae457a87.png")
        let typex2 = TypeX(name: "Khadgar", type: "Hero", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/4fb9aa0db87d27429255ecce8937828e8f0b3a06f3ef30c6017df625ae457a87.png")
        XCTAssertNotEqual(typex1, typex2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/4fb9aa0db87d27429255ecce8937828e8f0b3a06f3ef30c6017df625ae457a87.png")
    }
}
