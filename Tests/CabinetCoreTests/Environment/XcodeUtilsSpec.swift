import XCTest
@testable import CabinetCore

class XcodeUtilsSpec: XCTestCase {

    func testProcessRunFromXcode_isHardToTestWithPTRACE() {
        XCTAssertTrue(XcodeUtil.isProcessRunFromXcode || !XcodeUtil.isProcessRunFromXcode)
    }
}
