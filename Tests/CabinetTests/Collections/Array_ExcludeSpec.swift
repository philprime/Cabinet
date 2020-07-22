import Quick
import Nimble
@testable import Cabinet

class Array_Exclude_Spec: QuickSpec {

    override func spec() {
        describe("Array") {
            describe("exclude") {
                it("should exclude all elements of other array") {
                    expect([1,2,3].exclude([1,2,3])) == []
                }

                it("should not exclude elements which are not in other array") {
                    expect([1,2,3].exclude([3,4,5])) == [1,2]
                }

                it("should not ignore empty other array") {
                    expect([1,2,3].exclude([])) == [1,2,3]
                }
            }
        }
    }
}
