import XCTest
@testable import CabinetCore

class BitsSpec: XCTestCase {

    let bits: [Bit] = [.zero, .zero, .one, .one, .zero, .one, .zero, .one]
    let byte = Bits(byte: 0b10101100)

    func testSubscriptAccessor_canBeAccessedFromTheLeastSignificantBit() {
        for (pos, b) in bits.enumerated() {
            XCTAssertEqual(byte[pos], b)
        }
    }

    func testSubscriptAccessor_canBeAccessedFromTheMostSignificantBit() {
        for (pos, b) in bits.reversed().enumerated() {
            XCTAssertEqual(byte[fromMSB: pos], b)
        }
    }
}
