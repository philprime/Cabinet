import XCTest
@testable import CabinetCollections

class Array_SafeSpec: XCTestCase {

    let values = [
        1,
        2,
        3
    ]
    let emptyValues = Array<String>()

    func testSafeSubscript_nonEmptyArrayWithIndexBelowZero_shouldReturnNil() {
        XCTAssertNil(values[safe: -1])
    }

    func testSafeSubscript_nonEmptyArrayWithIndexOutOfBounds_shouldReturnNil() {
        XCTAssertNil(values[safe: 4])
    }

    func testSafeSubscript_nonEmptyArrayWithIndexInBounds_shouldReturnValue() {
        XCTAssertEqual(values[safe: 0], 1)
        XCTAssertEqual(values[safe: 1], 2)
        XCTAssertEqual(values[safe: 2], 3)
    }

    func testSafeSubscript_emptyArray_shouldReturnNil() {
        XCTAssertNil(emptyValues[safe: 0])
    }
}
