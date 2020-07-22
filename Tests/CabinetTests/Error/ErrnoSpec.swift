import Quick
import Nimble
@testable import Cabinet
import Darwin

class ErrnoSpec: QuickSpec {

    override func spec() {
        describe("Errno") {
            describe("description") {
                context("sample error given") {
                    it("should return a Swift string") {
                        let origErrno = errno
                        errno = 1
                        expect(Errno.description) == "Operation not permitted (1)"
                        errno = origErrno
                    }
                }
            }
        }
    }
}
