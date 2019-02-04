import Quick
import Nimble
@testable import EcommerceDemo

class ProductDismisserSpec: QuickSpec {
    override func spec() {
        describe("ProductDismisser") {
            var sut: ProductDismisser!

            beforeEach {
                sut = ProductDismisser()
            }

            context("dismiss") {
                var viewController: ViewControllerDouble!

                beforeEach {
                    viewController = ViewControllerDouble()
                    sut.dismiss(productViewController: viewController)
                }

                it("should dismiss from presenting view controller") {
                    expect(viewController.presentingViewControllerDouble.didDismissAnimated) == true
                }
            }
        }
    }
}

private class ViewControllerDouble: UIViewController {
    let presentingViewControllerDouble = PresentingViewControllerDouble()

    override var presentingViewController: UIViewController? {
        return presentingViewControllerDouble
    }
}

private class PresentingViewControllerDouble: UIViewController {
    private(set) var didDismissAnimated: Bool?

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        didDismissAnimated = flag
    }
}
