//
//  InfoTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class InfoTests: XCTestCase, DecodableTestCase {
    
    var sut: Info?
    
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

    func test_CheckIfEqual() {
        XCTAssertEqual(sut?.races[0], "Orc")
    }

    func test_CheckIfNotEqual() {
        XCTAssertNotEqual(sut?.races[0], "Murloc")
    }
    
    func testValues() {
        XCTAssertEqual(sut?.classes.count, 14)
    }
}
