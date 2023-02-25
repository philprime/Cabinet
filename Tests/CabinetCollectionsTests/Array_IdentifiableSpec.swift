//
//  Array+Identifiable_Spec.swift
//  CabinetCollectionsTests
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import XCTest
@testable import CabinetCollections

@available(iOS 13, macOS 10.15, *)
class Array_Identifiable_Spec: XCTestCase {


    struct Item: Identifiable {
        let id: String
        let value: String
    }

    func testFirstById_elementWithSameId_shouldBeFound() {
        let item = Item(id: "2", value: "Value 2")
        let firstItem = [
            Item(id: "1", value: "Value 1"),
            Item(id: "2", value: "Value 2"),
            Item(id: "3", value: "Value 3")
        ].first(byId: item)
        XCTAssertEqual(firstItem?.id, item.id)
        XCTAssertEqual(firstItem?.value, item.value)
    }

    func testFirstById_elementWithSameIdDifferentData_shouldReturnDifferentData() {
        let item = Item(id: "2", value: "Something different")
        let firstItem = [
            Item(id: "1", value: "Value 1"),
            Item(id: "2", value: "Value 2"),
            Item(id: "3", value: "Value 3")
        ].first(byId: item)
        XCTAssertEqual(firstItem?.id, item.id)
        XCTAssertEqual(firstItem?.value, "Value 2")
    }

    func testFirstById_noItemWithSameID_shouldReturnNil() {
        let item = Item(id: "4", value: "Anything")
        let firstItem = [
            Item(id: "1", value: "Value 1"),
            Item(id: "2", value: "Value 2"),
            Item(id: "3", value: "Value 3")
        ].first(byId: item)
        XCTAssertNil(firstItem)
    }
}
