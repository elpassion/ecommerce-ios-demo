import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class RoundButtonSpec: QuickSpec {
    override func spec() {
        describe("RoundButton") {
            var sut: RoundButton!

            beforeEach {
                sut = RoundButton()
                sut.titleLabel.text = "Button Title"
            }

            it("should have correct snapshot") {
                assertSnapshot(matching: .view(with: sut, margin: 100), as: .image)
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(RoundButton(coder: NSCoder())).to(beNil())
            }
        }
    }
}
