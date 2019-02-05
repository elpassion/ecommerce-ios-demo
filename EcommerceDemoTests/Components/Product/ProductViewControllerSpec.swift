import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductViewControllerSpec: QuickSpec {
    override func spec() {
        describe("factory") {
            var factory: ProductViewControllerFactory!
            var dismisser: ProductDismissingDouble!

            beforeEach {
                dismisser = ProductDismissingDouble()
                factory = ProductViewControllerFactory()
                factory.dismisser = dismisser
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
                        sut?.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
                    }

                    it("should have correct snapshot") {
                        expectNotNil(sut).then {
                            assertSnapshot(matching: $0, as: .image(on: .iPhoneX), named: "surface")
                        }
                    }

                    context("tap close button") {
                        beforeEach {
                            let view = sut?.view as? ProductView
                            view?.closeButton.sendActions(for: .touchUpInside)
                        }

                        it("should dismiss self") {
                            expect(dismisser.didDismissViewController) === sut
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
