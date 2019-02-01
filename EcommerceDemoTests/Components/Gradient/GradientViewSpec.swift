import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class GradientViewSpec: QuickSpec {
    override func spec() {
        describe("with style") {
            var sut: GradientView!

            beforeEach {
                sut = GradientView(style: GradientStyle(
                    colors: [
                        GradientColor(location: 0.1, color: .red),
                        GradientColor(location: 0.3, color: .green),
                        GradientColor(location: 0.8, color: .blue)
                    ],
                    direction: GradientDirection(
                        startPoint: CGPoint(x: 0, y: 0),
                        endPoint: CGPoint(x: 1, y: 1)
                    )
                ))
                sut.layoutPinWidth(to: 40)
                sut.layoutPinHeight(to: 30)
            }

            it("should have correct snapshot") {
                assertSnapshot(matching: aView(with: sut), as: .image)
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(GradientView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
