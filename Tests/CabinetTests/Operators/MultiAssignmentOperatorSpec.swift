import Quick
import Nimble
@testable import Cabinet

class MultiAssignmentOperatorSpec: QuickSpec {

    override func spec() {
        describe("MultiAssignmentOperator") {
            describe("assignment operator") {
                it("should assign and return identical value") {
                    class Universe {}

                    let value = Universe()
                    var other: Universe?
                    let result = other <-- value
                    expect(result) === value
                    expect(other) === value
                }
            }

            describe("nil-assignment operator") {
                it("should assign if the target is nil") {
                    class Universe {}

                    let value = Universe()
                    var other: Universe? = Universe()
                    let result = other <-?- value
                    expect(value) !== other
                    expect(result) === value
                    expect(result) !== other
                }
            }
        }
    }
}
