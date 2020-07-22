import Quick
import Nimble
@testable import Cabinet

class Dictionary_NilSpec: QuickSpec {

    override func spec() {
        describe("Dictionary") {
            describe("trimming nil values") {
                context("string key and string value") {
                    it("should remove any nil values") {
                        expect(["A": "a", "B": nil].trimmingNullValues) == ["A": "a"]
                    }
                }
            }
        }
    }
}
