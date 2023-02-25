import XCTest
import Foundation
@testable import CabinetCrypto

class Data_SHA1Spec: XCTestCase {

    func testSha1Hash_shouldReturnCorrectValue() {
        XCTAssertEqual(Data([1, 2, 3, 4, 5]).sha1, [17, 150, 106, 185, 192, 153, 248, 250, 190, 250, 197, 76, 8, 213, 190, 43, 216, 201, 3, 175])
    }
}
