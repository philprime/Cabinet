//
//  Array+Identifiable_Spec.swift
//  CabinetTests
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import Quick
import Nimble
@testable import Cabinet

@available(OSX 10.15, *)
class Array_Identifiable_Spec: QuickSpec {

    override func spec() {
        describe("Array") {
            describe("Identifiable") {
                describe("first by id") {

                    struct Item: Identifiable {
                        let id: String
                        let value: String
                    }

                    it("should find element with same id") {
                        let item = Item(id: "2", value: "Value 2")
                        let firstItem = [
                            Item(id: "1", value: "Value 1"),
                            Item(id: "2", value: "Value 2"),
                            Item(id: "3", value: "Value 3"),
                        ].first(byId: item)
                        expect(firstItem?.id) == item.id
                        expect(firstItem?.value) == item.value
                    }

                    it("should find element with same id but different data") {
                        let item = Item(id: "2", value: "Something different")
                        let firstItem = [
                            Item(id: "1", value: "Value 1"),
                            Item(id: "2", value: "Value 2"),
                            Item(id: "3", value: "Value 3"),
                        ].first(byId: item)
                        expect(firstItem?.id) == item.id
                        expect(firstItem?.value) == "Value 2"
                    }

                    it("should return nil if no item with same ID is found") {
                        let item = Item(id: "4", value: "Anything")
                        let firstItem = [
                            Item(id: "1", value: "Value 1"),
                            Item(id: "2", value: "Value 2"),
                            Item(id: "3", value: "Value 3"),
                        ].first(byId: item)
                        expect(firstItem).to(beNil())
                    }
                }
            }
        }
    }
}
