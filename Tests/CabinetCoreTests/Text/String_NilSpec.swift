//
//  Array+Identifiable_Spec.swift
//  CabinetCoreTests
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import XCTest
@testable import CabinetCore

class String_NilSpec: XCTestCase {

    func testNilIfEmpty_stringIsEmpty_shouldReturnNil() {
        XCTAssertNil("".nilIfEmpty)
    }

    func testNilIfEmpty_stringIsNotEmpty_shouldReturnString() {
        XCTAssertEqual("ABC".nilIfEmpty, "ABC")
    }
}
