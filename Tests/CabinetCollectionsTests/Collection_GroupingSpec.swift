import Quick
import Nimble
@testable import CabinetCollections

class Collection_GroupingSpec: QuickSpec {

    override func spec() {
        describe("Collection") {
            describe("grouped") {
                it("should group by the key of the closure") {
                    struct TestObj: Equatable {
                        let key: String
                        let value: Int
                    }
                    let base = [
                        TestObj(key: "A", value: 1),
                        TestObj(key: "A", value: 2),
                        TestObj(key: "A", value: 3),
                        TestObj(key: "B", value: 2)
                    ]
                    expect(base.grouped(by: { $0.key })) == [
                        "A": [TestObj(key: "A", value: 1), TestObj(key: "A", value: 2), TestObj(key: "A", value: 3)],
                        "B": [TestObj(key: "B", value: 2)]
                    ]
                }
            }
        }
    }
}
