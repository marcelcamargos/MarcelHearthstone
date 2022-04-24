//
//  MainViewControllerTests.swift
//  MarcelHearthstoneUITests
//
//  Created by Marcel Camargos on 24/04/22.
//

import XCTest
@testable import MarcelHearthstone

class MainViewControllerTests: XCTestCase {

    var app: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app?.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testHomeScreen_ShouldShowLabel() {
        XCTAssertTrue(app?.staticTexts["Hearthstone"].exists != nil)
    }
}
