import Quick
import Nimble
@testable import EcommerceDemo

class AppDelegateSpec: QuickSpec {
    override func spec() {
        describe("AppDelegate") {
            var sut: AppDelegate!

            beforeEach {
                sut = AppDelegate()
            }

            context("app did finish launching") {
                var result: Bool!

                beforeEach {
                    result = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
                }

                it("should return true") {
                    expect(result) == true
                }

                describe("window") {
                    var window: UIWindow?

                    beforeEach {
                        window = sut.window
                    }

                    it("should not be nil") {
                        expect(window).notTo(beNil())
                    }

                    it("should have correct frame") {
                        expect(window?.frame) == UIScreen.main.bounds
                    }

                    it("should have correct root view controller") {
                        expect(window?.rootViewController).to(beAnInstanceOf(DealsViewController.self))
                    }

                    it("should be a visible key window") {
                        expect(window?.isHidden) == false
                        expect(window?.isKeyWindow) == true
                    }
                }
            }
        }
    }
}