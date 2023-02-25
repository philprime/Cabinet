import XCTest
@testable import CabinetFoundation

class UUIDSpec: XCTestCase {

    func testUuidString_shouldBeValidV4String() {
        let uuid = CabinetFoundation.UUID().uuidString
        let comps = uuid.split(separator: "-")
        XCTAssertEqual(comps.count, 5)
        XCTAssertEqual(comps[0].count, 8)
        XCTAssertEqual(comps[1].count, 4)
        XCTAssertEqual(comps[2].count, 4)
        XCTAssertEqual(comps[3].count, 4)
        XCTAssertEqual(comps[4].count, 12)
    }
}
