import XCTest
@testable import CabinetCollections

class Sequence_UniqueSpec: XCTestCase {

    struct TestObject: Equatable {
        let id: String
    }


    func testUniqueByKeyPath_shouldReturnSameComparingProperties() {
        let sequence = [
            TestObject(id: "id-1"),
            TestObject(id: "id-1"),
            TestObject(id: "id-3"),
        ]
        XCTAssertEqual(sequence.unique(by: \.id), sequence.unique(by: { lhs, rhs in
            lhs.id == rhs.id
        }))
    }

    func testUniqueByComparator_emptySequence_shouldReturnEmptySequence() {
        let sequence: [TestObject] = []
        XCTAssertEqual(sequence.unique(by: \.id).count, 0)
    }

    func testUniqueByComparator_uniqueValues_shouldReturnSameSequence() {
        let sequence = [
            TestObject(id: "id-1"),
            TestObject(id: "id-2"),
            TestObject(id: "id-3"),
        ]
        XCTAssertEqual(sequence.unique(by: \.id), sequence)
    }

    func testUniqueByComparator_duplicateIdentifiers_shouldRemoveDuplicates() {
        let sequence = [
            TestObject(id: "id-1"),
            TestObject(id: "id-1"),
            TestObject(id: "id-3"),
        ]
        XCTAssertEqual(sequence.unique(by: \.id), [
            TestObject(id: "id-1"),
            TestObject(id: "id-3"),
        ])
    }

    func testUniqueByComparator_duplicateIdentifiers_shouldReturnFirstOccurance() {
        struct AnotherTestObject: Equatable {
            let id: String
            let value: String
        }
        let sequence = [
            AnotherTestObject(id: "id-1", value: "value-1"),
            AnotherTestObject(id: "id-1", value: "value-2"),
            AnotherTestObject(id: "id-3", value: "value-3"),
        ]
        XCTAssertEqual(sequence.unique(by: \.id), [
            AnotherTestObject(id: "id-1", value: "value-1"),
            AnotherTestObject(id: "id-3", value: "value-3"),
        ])
    }
}
