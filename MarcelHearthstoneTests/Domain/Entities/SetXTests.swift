//
//  SetX.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class SetXTests: XCTestCase, DecodableTestCase {
    
    var sut: SetX?
    
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
        let setx1 = SetX(name: "Khadgar", cardSet: "Madness At The Darkmoon Faire", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/98cb60b0edcf3911a4acdc67c9f2c3e4ee4cb9ae9a73e739f706571ed29a8ac2.png")
        let setx2 = SetX(name: "Khadgar", cardSet: "Madness At The Darkmoon Faire", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/98cb60b0edcf3911a4acdc67c9f2c3e4ee4cb9ae9a73e739f706571ed29a8ac2.png")
        XCTAssertEqual(setx1, setx2)
    }
    
    func testInit_WhenGivenValues_CheckIfNotEqual() {
        let setx1 = SetX(name: "Khadgar", cardSet: "", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/98cb60b0edcf3911a4acdc67c9f2c3e4ee4cb9ae9a73e739f706571ed29a8ac2.png")
        let setx2 = SetX(name: "Khadgar", cardSet: "Madness At The Darkmoon Faire", img: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/98cb60b0edcf3911a4acdc67c9f2c3e4ee4cb9ae9a73e739f706571ed29a8ac2.png")
        XCTAssertNotEqual(setx1, setx2)
    }
    
    func testValues() {
        XCTAssertEqual(sut?.img, "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/8993e2a16c19d2446fc516da6e82c3982723f25767a813285b0067eb92524a28.png")
    }
}
