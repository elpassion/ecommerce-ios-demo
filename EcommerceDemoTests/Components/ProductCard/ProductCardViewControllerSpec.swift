import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductCardViewControllerSpec: QuickSpec {
    override func spec() {
        describe("factory") {
            var factory: ProductCardViewControllerFactory!
            var presenter: ProductPresentingDouble!

            beforeEach {
                presenter = ProductPresentingDouble()
                factory = ProductCardViewControllerFactory()
                factory.presenter = presenter
            }

            context("create") {
                var sut: ProductCardViewController!
                var product: Product!

                beforeEach {
                    product = .surface
                    sut = factory.create(with: product)
                }

                context("load view") {
                    var width: CGFloat!

                    beforeEach {
                        width = 295
                        sut?.view.layoutPinWidth(to: width)
                        sut?.view.layoutPinHeight(to: 427)
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
                            expect(productCardView?.imageContainer.image) == product.photo
                            expect(productCardView?.nameLabel.text) == product.name
                            expect(productCardView?.priceLabel.text) == product.price
                            expect(productCardView?.button.titleLabel.text) == "Show more"
                        }

                        it("should have correct snapshot") {
                            expectNotNil(productCardView).then {
                                assertSnapshot(matching: .view(with: $0), as: .image, named: "surface")
                            }
                        }

                        context("move left") {
                            beforeEach {
                                sut.distanceFromCenter = -width
                            }

                            it("should have correct snapshot") {
                                expectNotNil(productCardView).then {
                                    assertSnapshot(matching: .view(with: $0), as: .image, named: "surface_left")
                                }
                            }
                        }

                        context("move right") {
                            beforeEach {
                                sut.distanceFromCenter = width
                            }

                            it("should have correct snapshot") {
                                expectNotNil(productCardView).then {
                                    assertSnapshot(matching: .view(with: $0), as: .image, named: "surface_right")
                                }
                            }
                        }

                        context("tap button") {
                            beforeEach {
                                productCardView?.button.sendActions(for: .touchUpInside)
                            }

                            it("should present product") {
                                expect(presenter.didPresentProduct?.name) == product.name
                                expect(presenter.didPresentFrom) === sut
                            }
                        }
                    }
                }
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(ProductCardViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
