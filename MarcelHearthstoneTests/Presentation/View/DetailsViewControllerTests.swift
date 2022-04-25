//
//  DetailsViewControllerTests.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Camargos on 23/04/22.
//

import XCTest
@testable import MarcelHearthstone

class DetailsViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testCardDownload() {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/faccebeea1dbcf52a13f5cc74ef12d5d9047becc04deec204b61a990f7d01606.png")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIEndpoints.headers
        
        let imageExpectation = expectation(description: "Session")
        
        URLSession.shared.dataTask(with: request as URLRequest) { (responseData, httpUrlResponse, error) in
            
            if(error == nil && responseData != nil && responseData?.count != 0) {
                guard let _ = UIImage(data: responseData ?? Data()) else {
                    XCTFail()
                    return
                }
                imageExpectation.fulfill()
            } else {
                XCTFail(error?.localizedDescription ?? "Failed")
            }
        }.resume()
        
        wait(for: [imageExpectation], timeout: 8)
    }
}
