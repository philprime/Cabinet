import XCTest
@testable import CabinetCollections

class Dictionary_CombineSpec: XCTestCase {

    func testDictionaryCombine_shouldProvideAnInfixOperator() {
        var firstData = [
            "A": 1,
            "B": 2
        ]
        var secondData = firstData
        let other = [
            "B": 9,
            "C": 8
        ]
        firstData +~ other
        secondData +~ other
        XCTAssertNotIdentical(firstData as AnyObject, secondData as AnyObject)
        XCTAssertEqual(firstData, secondData)
    }

    func testDictionaryCombine_shouldCombineTwoDictionariesByPriortisingOtherKeyValue() {
        let base = [
            "A": 1,
            "B": 2
        ]
        let other = [
            "B": 9,
            "C": 8
        ]
        XCTAssertEqual(base.combine(other), [
            "A": 1,
            "B": 9,
            "C": 8
        ])
    }
}
