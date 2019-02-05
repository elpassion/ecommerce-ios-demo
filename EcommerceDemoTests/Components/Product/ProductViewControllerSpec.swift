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
                        expectNotNil(sut).then { sut in
                            assertSnapshot(matching: sut, as: .image(on: .iPhoneX), named: "surface")
                        }
                    }

                    context("tap close button") {
                        beforeEach {
                            let button = (sut?.view as? ProductView)?.closeButton
                            if let target = button?.target, let action = button?.action {
                                _ = target.perform(action)
                            }
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
