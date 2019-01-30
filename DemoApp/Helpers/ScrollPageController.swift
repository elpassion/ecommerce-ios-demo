import UIKit

struct ScrollPageController {

    let pagePoints: [CGFloat]

    func targetContentOffsetX(current: CGFloat, velocity: CGFloat) -> CGFloat {
        if abs(velocity) < 0.1 {
            return pagePoint(for: current)
        }
        if velocity < 0 {
            return previousPagePoint(for: current)
        }
        return nextPagePoint(for: current)
    }

    private func pagePoint(for point: CGFloat) -> CGFloat {
        return pagePoints.min { abs($0 - point) < abs($1 - point) } ?? point
    }

    private func pageIndex(for point: CGFloat) -> Int? {
        return pagePoints.enumerated().min { abs($0.1 - point) < abs($1.1 - point) }?.offset
    }

    private func nextPagePoint(for point: CGFloat) -> CGFloat {
        guard let index = pageIndex(for: point) else { return point }
        let nextIndex = pagePoints.index(after: index)
        guard (pagePoints.startIndex..<pagePoints.endIndex).contains(nextIndex) else { return point }
        return pagePoints[nextIndex]
    }

    private func previousPagePoint(for point: CGFloat) -> CGFloat {
        guard let index = pageIndex(for: point) else { return point }
        let previousIndex = pagePoints.index(before: index)
        guard (pagePoints.startIndex..<pagePoints.endIndex).contains(previousIndex) else { return point }
        return pagePoints[previousIndex]
    }

}
