import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductSpecsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("with specs") {
            var sut: ProductSpecsViewController!

            beforeEach {
                sut = ProductSpecsViewController(specs: [
                    Product.Spec(name: "diagonal", value: "12.3”", icon: .iconDiagonal),
                    Product.Spec(name: "hard drive", value: "1TB", icon: .iconHardDrive),
                    Product.Spec(name: "RAM", value: "16GB", icon: .iconRam)
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
                expect(ProductSpecsViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
