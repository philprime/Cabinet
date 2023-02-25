import XCTest
@testable import CabinetCollections

class Array_Exclude_Spec: XCTestCase {

    func testExclude_equalArrays_shouldExcludeAllElementsOfOtherArray() {
        XCTAssertEqual([1, 2, 3].exclude([1, 2, 3]), [])
    }

    func testExclude_differentArrays_shouldNotExcludeElementsNotInOtherArray() {
        XCTAssertEqual([1, 2, 3].exclude([3, 4, 5]), [1, 2])
    }

    func testExclude_otherArrayEmpty_shouldIgnoreArray() {
        XCTAssertEqual([1, 2, 3].exclude([]), [1, 2, 3])
    }
}
