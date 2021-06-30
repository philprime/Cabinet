import Quick
import Nimble
@testable import CabinetFoundation

class UUIDSpec: QuickSpec {

    override func spec() {
        describe("UUID") {
            it("be valid UUID V4 string") {
                let uuid = CabinetFoundation.UUID().uuidString
                let comps = uuid.split(separator: "-")
                expect(comps).to(haveCount(5))
                expect(comps[0].count) == 8
                expect(comps[1].count) == 4
                expect(comps[2].count) == 4
                expect(comps[3].count) == 4
                expect(comps[4].count) == 12
            }
        }
    }
}
