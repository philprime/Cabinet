import XCTest
@testable import CabinetCollections

class Dictionary_NilSpec: XCTestCase {

    func testTrimmingNilValues_stringKeyAndStringValue_shouldRemoveAnyNilValues() {
        XCTAssertEqual(["A": "a", "B": nil].trimmingNullValues, ["A": "a"])
    }
}
