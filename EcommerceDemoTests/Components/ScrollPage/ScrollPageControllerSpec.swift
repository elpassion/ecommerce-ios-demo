import Quick
import Nimble
@testable import EcommerceDemo

class ScrollPageControllerSpec: QuickSpec {
    override func spec() {
        describe("ScrollPageController") {
            var sut: ScrollPageController!

            beforeEach {
                sut = ScrollPageController()
            }

            it("should return nil when no pages") {
                expect(sut.pageOffset(for: 1, velocity: 0, in: [])).to(beNil())
                expect(sut.pageOffset(for: 2, velocity: 2, in: [])).to(beNil())
                expect(sut.pageOffset(for: 3, velocity: -2, in: [])).to(beNil())
            }

            describe("three pages") {
                var pagePoints: [CGFloat]!

                beforeEach {
                    pagePoints = [0, 100, 200]
                }

                context("touch up") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = 0
                    }

                    it("should return closest page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[2]
                    }
                }

                context("swipe left") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = 2
                    }

                    it("should return next page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[2]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[2]
                    }
                }

                context("swipe right") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = -2
                    }

                    it("should return previous page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[1]
                    }
                }
            }
        }
    }
}
