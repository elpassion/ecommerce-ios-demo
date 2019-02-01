import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class TabBarViewSpec: QuickSpec {
    override func spec() {
        describe("TabBarView") {
            var sut: TabBarView!

            beforeEach {
                sut = TabBarView()
                sut.layoutPinWidth(to: 375.0)
            }

            it("should have correct snapshot") {
                assertSnapshot(matching: aView(with: sut), as: .image, named: "tabbar")
            }
        }

        describe("with coder") {
            it("should be nil") {
                expect(TabBarView(coder: NSCoder())).to(beNil())
            }
        }
    }
}
