import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductViewControllerSpec: QuickSpec {
    override func spec() {
        describe("factory") {
            var factory: ProductViewControllerFactory!

            beforeEach {
                factory = ProductViewControllerFactory()
            }

            context("create") {
                var sut: ProductViewController?
                var product: Product!

                beforeEach {
                    product = Product.surface
                    sut = factory.create(with: product) as? ProductViewController
                }

                context("load view") {
                    beforeEach {
                        _ = sut?.view
                    }

                    it("should have correct snapshot") {
                        expectNotNil(sut).then {
                            assertSnapshot(matching: $0, as: .image(on: .iPhoneX))
                        }
                    }
                }
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(ProductViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
