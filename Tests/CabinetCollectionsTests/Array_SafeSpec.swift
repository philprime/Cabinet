import Quick
import Nimble
@testable import CabinetCollections

class Array_SafeSpec: QuickSpec {

    override func spec() {
        describe("Array") {
            describe("Safe") {
                context("non-empty array") {
                    let values = [
                        1,
                        2,
                        3
                    ]

                    it("should return nil if index is below zero") {
                        expect(values[safe: -1]).to(beNil())
                    }

                    it("should return nil if index out of bounds") {
                        expect(values[safe: 4]).to(beNil())
                    }

                    it("should return value if valid index") {
                        expect(values[safe: 0]) == 1
                        expect(values[safe: 1]) == 2
                        expect(values[safe: 2]) == 3
                    }
                }

                context("empty array") {
                    let values: [Int] = []

                    it("should return nil") {
                        expect(values[safe: 0]).to(beNil())
                    }
                }
            }
        }
    }
}
