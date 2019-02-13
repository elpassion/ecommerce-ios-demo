import Quick
import Nimble
@testable import EcommerceDemo

class DealsViewSpec: QuickSpec {
    override func spec() {
        describe("init") {
            var sut: DealsView!

            beforeEach {
                sut = DealsView()
            }

            context("add product views") {
                var productViews: [UIView]!

                beforeEach {
                    productViews = [UIView(), UIView(), UIView()]
                    sut.productViews = productViews
                }

                it("should add product views to view hierarchy") {
                    expect(productViews.compactMap { $0.superview }).to(haveCount(productViews.count))
                }

                context("remove product views") {
                    beforeEach {
                        sut.productViews = []
                    }

                    it("should remove old product views from view hierarchy") {
                        expect(productViews.compactMap { $0.superview }).to(beEmpty())
                    }
                }
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(DealsView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
