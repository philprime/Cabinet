import XCTest
@testable import Cabinet

final class CabinetTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Cabinet().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
