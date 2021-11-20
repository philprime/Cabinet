import Quick
import Nimble
@testable import CabinetCore

class BitsSpec: QuickSpec {

    override func spec() {
        describe("Bits") {
            let bits: [Bit] = [.zero, .zero, .one, .one, .zero, .one, .zero, .one]
            let value: UInt8 = 0b10101100
            let byte = Bits(byte: value)

            it("can can be accessed from the least significant bit") {
                for (pos, b) in bits.enumerated() {
                    expect(byte[pos]) == b
                }
            }

            it("can can be accessed from the most significant bit") {
                for (pos, b) in bits.reversed().enumerated() {
                    expect(byte[fromMSB: pos]) == b
                }
            }
        }
    }
}
