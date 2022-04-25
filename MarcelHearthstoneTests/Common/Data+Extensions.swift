//
//  Data+Extensions.swift
//  MarcelHearthstoneTests
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 23/04/22.
//

import Foundation
import XCTest

extension Data {
    public static func fromJSON(fileName: String) throws -> Data {
        let bundle = Bundle(for: TestBundleClass.self)
        let url = try XCTUnwrap(bundle.url(forResource: fileName, withExtension: "json"))
        return try Data(contentsOf: url)
    }
}

private class TestBundleClass { }
