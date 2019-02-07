import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductPresentTransitionSpec: QuickSpec {
    override func spec() {
        describe("ProductPresentTransition") {
            var sut: ProductPresentTransition!
            var didAnimateWithDuration: TimeInterval?
            var animations: (() -> Void)?
            var completion: ((Bool) -> Void)?

            beforeEach {
                sut = ProductPresentTransition()
                sut.animator = {
                    didAnimateWithDuration = $0
                    animations = $1
                    completion = $2
                }
            }

            it("should return correct transition duration") {
                expect(sut.transitionDuration(using: nil)) == 0.25
            }

            context("animate without views") {
                var transitionContext: ContextDouble!

                beforeEach {
                    transitionContext = ContextDouble()
                    sut.cardView = nil
                    sut.productView = nil
                    sut.animateTransition(using: transitionContext)
                }

                it("should complete context with false") {
                    expect(transitionContext.didComplete) == false
                }
            }

            describe("scene") {
                var scene: UIView!
                var dealsViewController: UIViewController!
                var cardViewController: UIViewController!

                beforeEach {
                    scene = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
                    scene.layoutPinWidth(to: scene.frame.width)
                    scene.layoutPinHeight(to: scene.frame.height)
                    dealsViewController = DealsViewControllerFactory().create(with: [.surface])
                    scene.addSubview(dealsViewController.view)
                    dealsViewController.view.frame = scene.bounds
                    scene.setNeedsLayout()
                    scene.layoutIfNeeded()
                    cardViewController = dealsViewController.children.first!
                }

                context("present") {
                    var productViewController: UIViewController!
                    var transitionContext: ContextDouble!

                    beforeEach {
                        productViewController = ProductViewControllerFactory().create(with: .surface)
                        transitionContext = ContextDouble()
                        scene.addSubview(transitionContext.containerView)
                        transitionContext.containerView.frame = scene.bounds

                        sut.direction = .present
                        sut.cardView = cardViewController.view as? ProductCardView
                        sut.productView = productViewController.view as? ProductView
                        sut.animateTransition(using: transitionContext)
                    }

                    afterEach {
                        didAnimateWithDuration = nil
                        animations = nil
                        completion = nil
                    }

                    it("should add product view to container view") {
                        expect(productViewController.view.superview) === transitionContext.containerView
                    }

                    it("should enable clipping in product view") {
                        expect(productViewController.view.clipsToBounds) == true
                    }

                    it("should scene have correct snapshot") {
                        assertSnapshot(
                            matching: .view(with: scene),
                            as: .image,
                            named: "present_start",
                            timeout: 0
                        )
                    }

                    it("should animate with correct duration") {
                        expect(didAnimateWithDuration) == sut.transitionDuration(using: transitionContext)
                    }

                    context("when animating") {
                        beforeEach {
                            animations?()
                        }

                        it("should scene have correct snapshot") {
                            assertSnapshot(
                                matching: .view(with: scene),
                                as: .image,
                                named: "present_end",
                                timeout: 0
                            )
                        }

                        context("when animation completes with false") {
                            beforeEach {
                                completion?(false)
                            }

                            afterEach {
                                transitionContext.didComplete = nil
                            }

                            it("should complete context with false") {
                                expect(transitionContext.didComplete) == false
                            }
                        }

                        context("when animation completes with true") {
                            beforeEach {
                                completion?(true)
                            }

                            it("should complete context with true") {
                                expect(transitionContext.didComplete) == true
                            }

                            context("dismiss") {
                                beforeEach {
                                    sut.direction = .dismiss
                                    sut.animateTransition(using: transitionContext)
                                }

                                afterEach {
                                    didAnimateWithDuration = nil
                                    animations = nil
                                    completion = nil
                                }

                                it("should scene have correct snapshot") {
                                    assertSnapshot(
                                        matching: .view(with: scene),
                                        as: .image,
                                        named: "dismiss_start",
                                        timeout: 0
                                    )
                                }

                                it("should animate with correct duration") {
                                    expect(didAnimateWithDuration) == sut.transitionDuration(using: transitionContext)
                                }

                                context("when animating") {
                                    beforeEach {
                                        animations?()
                                    }

                                    it("should scene have correct snapshot") {
                                        assertSnapshot(
                                            matching: .view(with: scene),
                                            as: .image,
                                            named: "dismiss_end",
                                            timeout: 0
                                        )
                                    }

                                    context("when animation completes with false") {
                                        beforeEach {
                                            completion?(false)
                                        }

                                        afterEach {
                                            transitionContext.didComplete = nil
                                        }

                                        it("should complete context with false") {
                                            expect(transitionContext.didComplete) == false
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private class ContextDouble: NSObject, UIViewControllerContextTransitioning {

        var didComplete: Bool?

        // MARK: UIViewControllerContextTransitioning

        var containerView: UIView = UIView(frame: .zero)
        var isAnimated: Bool = false
        var isInteractive: Bool = false
        var transitionWasCancelled: Bool = false
        var presentationStyle: UIModalPresentationStyle = .overFullScreen
        var targetTransform: CGAffineTransform = .identity

        func updateInteractiveTransition(_ percentComplete: CGFloat) {}
        func finishInteractiveTransition() {}
        func cancelInteractiveTransition() {}
        func pauseInteractiveTransition() {}
        func completeTransition(_ didComplete: Bool) { self.didComplete = didComplete }
        func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? { return nil }
        func view(forKey key: UITransitionContextViewKey) -> UIView? { return nil }
        func initialFrame(for vc: UIViewController) -> CGRect { return .zero }
        func finalFrame(for vc: UIViewController) -> CGRect { return .zero }

    }

}
