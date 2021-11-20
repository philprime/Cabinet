import Quick
import Nimble
@testable import CabinetCore

class XcodeUtilsSpec: QuickSpec {

    override func spec() {
        describe("XcodeUtils") {
            it("is hard to test PTRACE") {
                expect(XcodeUtil.isProcessRunFromXcode || !XcodeUtil.isProcessRunFromXcode).to(beTrue())
            }
        }
    }
}
