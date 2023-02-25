import XCTest
@testable import CabinetCore

class MultiAssignmentOperatorSpec: XCTestCase {

    func testAssignmentOperator_identicalType_shouldAssignAndReturn() {
        class Universe {}

        let value = Universe()
        var other: Universe?
        let result = other <-- value
        XCTAssertIdentical(result, value)
        XCTAssertIdentical(other, value)
    }

    func testAssignmentOperator_inheritedType_shouldCastBeforeAssign() {
        class Planet {}
        class Earth: Planet {}

        let planet: Planet = Earth()
        var other: Earth?
        let result = other <-- planet as? Earth
        XCTAssertIdentical(result, planet)
        XCTAssertIdentical(other, planet)
        XCTAssertEqual(String(describing: type(of: result)), "Optional<Earth>")
    }

    func testNilAssignmentOperator_targetIsNil_shouldAssignValue() {
        class Universe {}

        let value = Universe()
        var other: Universe? = Universe()
        let result = other <-?- value
        XCTAssertNotIdentical(value, other)
        XCTAssertIdentical(result, value)
        XCTAssertNotIdentical(result, other)
    }

    func testNilFallbackAssignmentOperator_targetIsNil_shouldAssignNewValue() {
        class Universe {}

        let value = Universe()
        var other: Universe? = nil
        let originalOther = other
        let result = other <-??- value
        XCTAssertNotIdentical(other, originalOther)
        XCTAssertIdentical(result, value)
    }

    func testNilFallbackAssignmentOperator_targetIsNil_shouldReturnNewValue() {
        class Universe {}

        let value = Universe()
        var other: Universe? = nil
        let result = other <-??- value
        XCTAssertIdentical(result, value)
    }

    func testNilFallbackAssignmentOperator_targetHasValue_shouldNotAssignValue() {
        class Universe {}

        let value = Universe()
        var other: Universe? = Universe()

        let originalOther = other
        let result = other <-??- value
        XCTAssertIdentical(other, originalOther)
        XCTAssertNotIdentical(result, value)
    }

    func testNilFallbackAssignmentOperator_targetHasValue_shouldReturnOriginalValue() {
        class Universe {}

        let value = Universe()
        var other: Universe? = Universe()

        let result = other <-??- value
        XCTAssertIdentical(result, other)
    }
}
