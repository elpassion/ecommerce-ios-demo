import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductCardViewControllerSpec: QuickSpec {
    override func spec() {
        describe("ProductCardViewController") {
            var sut: ProductCardViewController!
            var product: Product!

            beforeEach {
                product = .surface
                sut = ProductCardViewController(product: product)
            }

            context("load view") {
                beforeEach {
                    _ = sut.view
                }

                describe("product card view") {
                    var productCardView: ProductCardView?

                    beforeEach {
                        productCardView = sut.view as? ProductCardView
                    }

                    it("should not be nil") {
                        expect(productCardView).notTo(beNil())
                    }

                    it("should be correctly configured") {
                        expect(productCardView?.topBackgroundView.backgroundColor) == product.color
                        expect(productCardView?.imageView.image) == product.image
                        expect(productCardView?.nameLabel.text) == product.name
                        expect(productCardView?.priceLabel.text) == product.price
                        expect(productCardView?.button.titleLabel.text) == "Show more"
                    }

                    it("should have correct snapshot") {
                        expectNotNil(productCardView).then {
                            let view = aView(with: $0).constrained(size: CGSize(width: 295, height: 427))
                            assertSnapshot(matching: view, as: .image, named: "surface")
                        }
                    }
                }
            }
        }

        context("with coder") {
            it("should be nil") {
                expect(ProductCardViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
