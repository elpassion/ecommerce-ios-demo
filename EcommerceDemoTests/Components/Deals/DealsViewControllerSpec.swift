import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class DealsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("factory") {
            var factory: DealsViewControllerFactory!

            beforeEach {
                factory = DealsViewControllerFactory()
            }

            context("create") {
                var sut: DealsViewController?

                beforeEach {
                    sut = factory.create(with: Product.demos) as? DealsViewController
                }

                it("should not be nil") {
                    expect(sut).notTo(beNil())
                }

                context("load view") {
                    beforeEach {
                        sut?.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
                        sut?.view.setNeedsLayout()
                        sut?.view.layoutIfNeeded()
                        sut?.viewDidAppear(false)
                    }

                    it("should have correct snapshot") {
                        expectNotNil(sut).then {
                            assertSnapshot(matching: $0, as: .image(on: .iPhoneX))
                        }
                    }

                    context("scroll view will end dragging") {
                        var targetContentOffset: UnsafeMutablePointer<CGPoint>!

                        beforeEach {
                            targetContentOffset = UnsafeMutablePointer.allocate(capacity: 1)
                            targetContentOffset.pointee = .zero
                            let scrollView = UIScrollView(frame: .zero)
                            scrollView.contentOffset.x = 10
                            sut?.scrollViewWillEndDragging(
                                scrollView,
                                withVelocity: CGPoint(x: 2, y: 0),
                                targetContentOffset: targetContentOffset
                            )
                        }

                        it("should set correct target content offset") {
                            expectNotNil(sut?.view as? DealsView).then {
                                let secondCardOffset = $0.productViews[1].frame.minX
                                let leftInset = $0.scrollView.adjustedContentInset.left
                                expect(targetContentOffset.pointee.x) == secondCardOffset - leftInset
                            }
                        }
                    }
                }
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(DealsViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
