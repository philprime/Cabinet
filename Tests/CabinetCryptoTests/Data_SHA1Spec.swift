import Quick
import Nimble
@testable import CabinetCrypto
import Foundation

class Data_SHA1Spec: QuickSpec {

    override func spec() {
        describe("Data") {
            describe("SHA1") {
                it("should return correct value") {
                    expect(Data([1, 2, 3, 4, 5]).sha1) == [17, 150, 106, 185, 192, 153, 248, 250, 190, 250, 197, 76, 8, 213, 190, 43, 216, 201, 3, 175]
                }
            }
        }
    }
}
