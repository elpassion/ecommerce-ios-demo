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

            it("should have correct view controller factory") {
                expect(sut.viewControllerFactory).to(beAnInstanceOf(DealsViewControllerFactory.self))
            }

            context("app did finish launching") {
                var viewControllerFactory: DealsViewControllerCreatingDouble!
                var result: Bool!

                beforeEach {
                    viewControllerFactory = DealsViewControllerCreatingDouble()
                    sut.viewControllerFactory = viewControllerFactory
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

                    it("should create root view controller with correct products") {
                        expect(viewControllerFactory.didCreateWithProducts?.map { $0.name })
                            == ([.oculus, .surface, .xbox] as [Product]).map { $0.name }
                    }

                    it("should have correct root view controller") {
                        expect(window?.rootViewController) === viewControllerFactory.createdViewController
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
