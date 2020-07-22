import Quick
import Nimble
@testable import Cabinet

class BitSpec: QuickSpec {

    override func spec() {
        describe("Bit") {
            let inputData = [
                (Bit.zero, "0", 0, false),
                (Bit.one, "1", 1, true)
            ]

            for (kind, expected, value, truthy) in inputData {
                describe("\(kind)") {
                    it("should have a int value") {
                        expect(kind.rawValue) == UInt8(value)
                    }

                    it("can be described") {
                        expect(kind.description) == expected
                    }

                    it("can be converted into a boolean value") {
                        expect(kind.asBool) == truthy
                    }
                }
            }
        }
    }
}
