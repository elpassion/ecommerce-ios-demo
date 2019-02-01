import Quick
import Nimble
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
                    sut = factory.create() as? DealsViewController
                }

                it("should not be nil") {
                    expect(sut).notTo(beNil())
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
