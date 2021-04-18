import Quick
import Nimble
@testable import CabinetCollections

class Sequence_UniqueSpec: QuickSpec {

    override func spec() {
        describe("Sequence") {

            struct TestObject: Equatable {
                let id: String
            }

            describe("unique by keypath") {
                it("should return same as comparing properties") {
                    let sequence = [
                        TestObject(id: "id-1"),
                        TestObject(id: "id-1"),
                        TestObject(id: "id-3"),
                    ]
                    expect(sequence.unique(by: \.id)) == sequence.unique(by: { lhs, rhs in
                        lhs.id == rhs.id
                    })
                }
            }

            describe("unique by comparator") {
                context("empty sequence") {
                    it("should return empty sequence") {
                        let sequence: [TestObject] = []
                        expect(sequence.unique(by: \.id)).to(beEmpty())
                    }
                }

                context("unique values") {
                    it("should return same sequence") {
                        let sequence = [
                            TestObject(id: "id-1"),
                            TestObject(id: "id-2"),
                            TestObject(id: "id-3"),
                        ]
                        expect(sequence.unique(by: \.id)) == sequence
                    }
                }

                context("duplicate identifiers") {
                    it("should remove duplicates") {
                        let sequence = [
                            TestObject(id: "id-1"),
                            TestObject(id: "id-1"),
                            TestObject(id: "id-3"),
                        ]
                        expect(sequence.unique(by: \.id)) == [
                            TestObject(id: "id-1"),
                            TestObject(id: "id-3"),
                        ]
                    }

                    it("should return first occurance") {
                        struct AnotherTestObject: Equatable {
                            let id: String
                            let value: String
                        }
                        let sequence = [
                            AnotherTestObject(id: "id-1", value: "value-1"),
                            AnotherTestObject(id: "id-1", value: "value-2"),
                            AnotherTestObject(id: "id-3", value: "value-3"),
                        ]
                        expect(sequence.unique(by: \.id)) == [
                            AnotherTestObject(id: "id-1", value: "value-1"),
                            AnotherTestObject(id: "id-3", value: "value-3"),
                        ]
                    }
                }
            }
        }
    }
}
