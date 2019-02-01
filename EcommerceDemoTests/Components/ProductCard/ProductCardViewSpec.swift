import Quick
import Nimble
@testable import EcommerceDemo

class ProductCardViewSpec: QuickSpec {
    override func spec() {
        describe("with coder") {
            it("should be nil") {
                expect(ProductCardView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
