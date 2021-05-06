import XCTest
@testable import CabinetPropertyWrappers

class AnyOptionalTests: XCTestCase {

    func testOptional_valueIsNil_isNilShouldReturnTrue() {
        let value: String? = nil
        XCTAssertTrue(value.isNil)
    }

    func testOptional_valueIsNotNil_isNilShouldReturnFalse() {
        let value: String? = "not nil"
        XCTAssertFalse(value.isNil)
    }

    func testOptional_valueIsNotNil_wrappedShouldReturnValue() {
        let value: String? = "not nil"
        XCTAssertTrue(value.wrapped is String)
        XCTAssertEqual(value.wrapped as? String, "not nil")
    }
}
