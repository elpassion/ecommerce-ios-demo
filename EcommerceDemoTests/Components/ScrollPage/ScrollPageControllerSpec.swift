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
                expect(sut.page(for: 1, velocity: 0, in: [])).to(beNil())
                expect(sut.page(for: 2, velocity: 2, in: [])).to(beNil())
                expect(sut.page(for: 3, velocity: -2, in: [])).to(beNil())
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
                        expect(sut.page(for: -1000, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 0, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 49, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 51, velocity: velocity, in: pagePoints)) == (1, pagePoints[1])
                        expect(sut.page(for: 1000, velocity: velocity, in: pagePoints)) == (2, pagePoints[2])
                    }
                }

                context("swipe left") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = 2
                    }

                    it("should return next page offset") {
                        expect(sut.page(for: -1000, velocity: velocity, in: pagePoints)) == (1, pagePoints[1])
                        expect(sut.page(for: 0, velocity: velocity, in: pagePoints)) == (1, pagePoints[1])
                        expect(sut.page(for: 49, velocity: velocity, in: pagePoints)) == (1, pagePoints[1])
                        expect(sut.page(for: 51, velocity: velocity, in: pagePoints)) == (2, pagePoints[2])
                        expect(sut.page(for: 1000, velocity: velocity, in: pagePoints)) == (2, pagePoints[2])
                    }
                }

                context("swipe right") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = -2
                    }

                    it("should return previous page offset") {
                        expect(sut.page(for: -1000, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 0, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 49, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 51, velocity: velocity, in: pagePoints)) == (0, pagePoints[0])
                        expect(sut.page(for: 1000, velocity: velocity, in: pagePoints)) == (1, pagePoints[1])
                    }
                }
            }
        }
    }
}

private func equal(_ expected: ScrollPageController.Page) -> Predicate<ScrollPageController.Page> {
    return Predicate.simple("equal <\(expected)>") { expression in
        switch try expression.evaluate() {
        case .some(let actual) where actual.index == expected.index && actual.offset == expected.offset:
            return .matches
        case .some:
            return .doesNotMatch
        case .none:
            return .fail
        }
    }
}

private func == (lhs: Expectation<ScrollPageController.Page>, rhs: ScrollPageController.Page) {
    return lhs.to(equal(rhs))
}
