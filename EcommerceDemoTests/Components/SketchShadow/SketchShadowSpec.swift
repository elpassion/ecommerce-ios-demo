import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class SketchShadowSpec: QuickSpec {
    override func spec() {
        describe("view with shadow") {
            var view: UIView!

            beforeEach {
                view = UIView(frame: .zero)
                view.backgroundColor = .blue
                view.layer.borderColor = UIColor.yellow.cgColor
                view.layer.borderWidth = 1
                view.layoutPinHeight(to: 100)
                view.layoutPinWidth(to: 100)
            }

            context("apply shadow without spread") {
                beforeEach {
                    view.layer.apply(SketchShadow(
                        color: .red,
                        x: 16,
                        y: -16,
                        blur: 32,
                        spread: 0
                    ))
                }

                it("should not have shadow path") {
                    expect(view.layer.shadowPath).to(beNil())
                }

                it("should have correct snapshot") {
                    assertSnapshot(matching: .view(with: view, margin: 100), as: .image, named: "without_spread")
                }
            }

            context("apply shadow with spread") {
                beforeEach {
                    view.layer.apply(SketchShadow(
                        color: .red,
                        x: -16,
                        y: 16,
                        blur: 8,
                        spread: 32
                    ))
                }

                it("should have shadow path") {
                    expect(view.layer.shadowPath).notTo(beNil())
                }

                it("should have correct snapshot") {
                    assertSnapshot(matching: .view(with: view, margin: 100), as: .image, named: "with_spread")
                }
            }
        }
    }
}
