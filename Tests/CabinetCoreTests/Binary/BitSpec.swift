import XCTest
@testable import CabinetCore

class BitSpec: XCTestCase {
    
    func testIntValue_bitZero_shouldHaveAnIntValue() {
        XCTAssertEqual(Bit.zero.rawValue, 0)
    }
    
    func testIntValue_bitZero_canBeDescribed() {
        XCTAssertEqual(Bit.zero.description, "0")
    }
    
    func testIntValue_bitZero_canBeConvertedIntoABoolValue() {
        XCTAssertEqual(Bit.zero.asBool, false)
    }
    
    func testIntValue_bitOne_shouldHaveAnIntValue() {
        XCTAssertEqual(Bit.one.rawValue, 1)
    }
    
    func testIntValue_bitOne_canBeDescribed() {
        XCTAssertEqual(Bit.one.description, "1")
    }
    
    func testIntValue_bitOne_canBeConvertedIntoABoolValue() {
        XCTAssertEqual(Bit.one.asBool, true)
    }
}
