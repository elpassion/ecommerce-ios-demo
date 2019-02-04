import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductCardViewSpec: QuickSpec {
    override func spec() {
        context("init") {
            var sut: ProductCardView!

            beforeEach {
                sut = ProductCardView()
            }

            it("should have correct snapshot") {
                assertSnapshot(matching: aView(with: sut), as: .image, named: "empty")
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(ProductCardView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
