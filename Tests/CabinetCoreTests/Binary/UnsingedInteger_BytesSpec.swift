import Quick
import Nimble
@testable import CabinetCore

class UnsignedInteger_BytesSpec: QuickSpec {

    override func spec() {
        describe("UnsignedInteger+Bytes") {
            context("16 bits") {
                it("should be correct with one byte") {
                    expect(UInt16([0b1010_1010])) == 0b0000_0000_1010_1010
                }

                it("should be correct with two bytes") {
                    expect(UInt16([0b1100_1100, 0b1010_1010])) == 0b1100_1100_1010_1010
                }

                it("should be fail with too many bits") {
                    expect {
                        _ = UInt16([0b1111, 0b1100_1100, 0b1010_1010])
                    }.to(throwAssertion())
                }
            }
        }
    }
}
