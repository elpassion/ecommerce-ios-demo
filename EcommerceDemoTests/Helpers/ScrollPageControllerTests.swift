import XCTest
@testable import EcommerceDemo

class ScrollPageControllerTests: XCTestCase {

    func testNoPagesTouchUp() {
        let sut = ScrollPageController(pagePoints: [])
        let current = CGFloat(1234)
        let target = sut.targetContentOffsetX(current: current, velocity: 0)
        XCTAssertEqual(target, current)
    }

    func testNoPagesSwipeLeft() {
        let sut = ScrollPageController(pagePoints: [])
        let current = CGFloat(1234)
        let target = sut.targetContentOffsetX(current: current, velocity: 1)
        XCTAssertEqual(target, current)
    }

    func testNoPagesSwipeRight() {
        let sut = ScrollPageController(pagePoints: [])
        let current = CGFloat(1234)
        let target = sut.targetContentOffsetX(current: current, velocity: -1)
        XCTAssertEqual(target, current)
    }

    func testTouchUp() {
        let sut = ScrollPageController(pagePoints: [0, 100, 200, 300])
        let current = CGFloat(110)
        let target = sut.targetContentOffsetX(current: current, velocity: 0)
        XCTAssertEqual(target, 100)
    }

    func testSwipeLeft() {
        let sut = ScrollPageController(pagePoints: [0, 100, 200, 300])
        let current = CGFloat(110)
        let target = sut.targetContentOffsetX(current: current, velocity: 1)
        XCTAssertEqual(target, 200)
    }

    func testSwipeRight() {
        let sut = ScrollPageController(pagePoints: [0, 100, 200, 300])
        let current = CGFloat(190)
        let target = sut.targetContentOffsetX(current: current, velocity: -1)
        XCTAssertEqual(target, 100)
    }

}
