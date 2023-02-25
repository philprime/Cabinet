import XCTest
@testable import CabinetCore

class UnsignedInteger_BytesSpec: XCTestCase {

    func testByteInitializer_16bits_shouldBeCorrectWithOneByte() {
        XCTAssertEqual(UInt16([0b1010_1010]), 0b0000_0000_1010_1010)
    }

    func testByteInitializer_16bits_shouldBeCorrectWithTwoBytes() {
        XCTAssertEqual(UInt16([0b1100_1100, 0b1010_1010]), 0b1100_1100_1010_1010)
    }

    func testByteInitializer_16bits_shouldFailWithTooManyBits() {
        #if arch(x86_64)
        XCTAssertThrowsError({
            UInt16([0b1111, 0b1100_1100, 0b1010_1010])
        })
        #endif
    }
}
