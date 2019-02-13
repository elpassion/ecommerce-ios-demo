import Quick
import Nimble
@testable import EcommerceDemo

class DealsViewSpec: QuickSpec {
    override func spec() {
        describe("with coder") {
            it("should be nil") {
                expect(DealsView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
