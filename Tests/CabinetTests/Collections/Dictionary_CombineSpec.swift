import Quick
import Nimble
@testable import Cabinet

class Dictionary_CombineSpec: QuickSpec {

    override func spec() {
        describe("Dictionary") {
            describe("Combine") {
                it("should exist an infix operator") {
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
                    expect(firstData) !== secondData
                    expect(firstData) == secondData
                }

                it("should combine two dictionaries by prioritising other key-value") {
                    let base = [
                        "A": 1,
                        "B": 2
                    ]
                    let other = [
                        "B": 9,
                        "C": 8
                    ]
                    expect(base.combine(other)) == [
                        "A": 1,
                        "B": 9,
                        "C": 8
                    ]
                }
            }
        }
    }
}
