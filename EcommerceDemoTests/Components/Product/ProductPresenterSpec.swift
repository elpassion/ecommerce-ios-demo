import Quick
import Nimble
@testable import EcommerceDemo

class ProductPresenterSpec: QuickSpec {
    override func spec() {
        describe("ProductPresenter") {
            var sut: ProductPresenter!
            var factory: ProductViewControllerCreatingDouble!

            beforeEach {
                factory = ProductViewControllerCreatingDouble()
                sut = ProductPresenter(factory: factory)
            }

            it("should return nil animation controllers") {
                expect(sut.animationController(
                    forPresented: UIViewController(),
                    presenting: UIViewController(),
                    source: UIViewController()
                )).to(beNil())
                expect(sut.animationController(
                    forDismissed: UIViewController()
                )).to(beNil())
            }

            context("present") {
                var product: Product!
                var presenting: PresentingViewControllerDouble!

                beforeEach {
                    product = .xbox
                    presenting = PresentingViewControllerDouble()
                    sut.present(product, from: presenting)
                }

                it("should create view controller with correct product") {
                    expect(factory.didCreateWithProduct?.name) == product.name
                }

                it("should set over full screen presentation style") {
                    expect(factory.createdViewController.modalPresentationStyle) == .overFullScreen
                }

                it("should be transitioning delegate") {
                    expect(factory.createdViewController.transitioningDelegate) === sut
                }

                it("should present created view controller from presenting") {
                    expect(presenting.didPresentViewController) === factory.createdViewController
                    expect(presenting.didPresentAnimated) == true
                }
            }
        }
    }
}

private class PresentingViewControllerDouble: UIViewController {
    private(set) var didPresentViewController: UIViewController?
    private(set) var didPresentAnimated: Bool?

    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        didPresentViewController = viewControllerToPresent
        didPresentAnimated = flag
    }
}
