//
//  ArraySlice_CountSpec.swift
//  CabinetCollectionsTests
//
//  Created by Philip Niedertscheider on 25.09.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import XCTest
@testable import CabinetCollections

class ArraySlice_CountSpec: XCTestCase {

    func testCount_emptyArray_shouldReturnZero() {
        XCTAssertEqual([Int]()[0..<0].count(where: { $0 == 1 }), 0)
    }

    func testCount_nonEmptyArray_shouldReturnCorrectCount() {
        let values = [
            1,
            1,
            2,
            2,
            3,
            1,
            2,
            3
        ]
        let slice = values[0...5]
        XCTAssertEqual(slice.count(where: { $0 == 1 }), 3)
        XCTAssertEqual(slice.count(where: { $0 == 2 }), 2)
        XCTAssertEqual(slice.count(where: { $0 == 3 }), 1)
    }
}
