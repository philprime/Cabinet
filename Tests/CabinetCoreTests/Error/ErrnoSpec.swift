import Darwin
import XCTest
@testable import CabinetCore

class ErrnoSpec: XCTestCase {

    func testDescription_sampleErrorGiven_shouldReturnSwiftString() {
        let origErrno = errno
        errno = 1
        XCTAssertEqual(Errno.description, "Operation not permitted (1)")
        errno = origErrno
    }
}
