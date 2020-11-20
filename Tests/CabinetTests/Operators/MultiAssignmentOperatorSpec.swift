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

                it("should cast before assigning") {
                    class Planet {}
                    class Earth: Planet {}

                    let planet: Planet = Earth()
                    var other: Earth?
                    let result = other <-- planet as? Earth
                    expect(result) === planet
                    expect(other) === planet
                    expect(String(describing: type(of: result))) == "Optional<Earth>"
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
