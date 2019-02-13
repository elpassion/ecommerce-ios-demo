import Quick
import Nimble
@testable import EcommerceDemo

class ImageContainerSpec: QuickSpec {
    override func spec() {
        describe("with coder") {
            it("should be nil") {
                expect(ImageContainer(coder: NSCoder())).to(beNil())
            }
        }
    }
}
