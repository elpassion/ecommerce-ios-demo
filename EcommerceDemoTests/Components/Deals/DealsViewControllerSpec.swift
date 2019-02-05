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
                expect(DealsViewController(coder: NSCoder())).to(beNil())
            }
        }
    }
}
