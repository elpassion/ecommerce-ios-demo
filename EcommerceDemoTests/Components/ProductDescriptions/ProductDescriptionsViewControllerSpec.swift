import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductDescriptionsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("with descriptions") {
            var sut: ProductDescriptionsViewController!

            beforeEach {
                let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."
                sut = ProductDescriptionsViewController(descriptions: [
                    .header("Header. " + loremIpsum),
                    .text("First paragraph. " + (0..<2).map { _ in loremIpsum }.joined(separator: " ")),
                    .photo(.productSurfacePhoto),
                    .text("Second paragraph." + (0..<5).map { _ in loremIpsum }.joined(separator: " "))
                ])
            }

            context("load view") {
                beforeEach {
                    sut.view.layoutPinWidth(to: 375)
                }

                it("should have correct snapshot") {
                    assertSnapshot(matching: .view(with: sut.view), as: .image)
                }
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(ProductDescriptionsViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
