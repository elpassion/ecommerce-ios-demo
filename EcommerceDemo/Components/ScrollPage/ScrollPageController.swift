import UIKit

struct ScrollPageController {

    typealias Page = (index: Int, offset: CGFloat)

    func page(for offset: CGFloat, velocity: CGFloat, in pageOffsets: [CGFloat]) -> Page? {
        guard let currentPage = currentPage(for: offset, in: pageOffsets) else {
            return nil
        }
        if abs(velocity) < 0.2 {
            return currentPage
        }
        if velocity > 0 {
            return nextPage(for: currentPage, in: pageOffsets) ?? currentPage
        }
        return previousPage(for: currentPage, in: pageOffsets) ?? currentPage
    }

    private func currentPage(for offset: CGFloat, in pageOffsets: [CGFloat]) -> Page? {
        let pageOffsetsDict: [Int: CGFloat] = pageOffsets.enumerated().reduce(.init()) {
            var dict = $0
            dict[$1.offset] = $1.element
            return dict
        }
        guard let page = pageOffsetsDict.min(by: { abs($0.value - offset) < abs($1.value - offset) }) else {
            return nil
        }
        return (index: page.key, offset: page.value)
    }

    private func previousPage(for page: Page, in pageOffsets: [CGFloat]) -> Page? {
        let pageIndex = pageOffsets.index(before: page.index)
        guard (pageOffsets.startIndex..<pageOffsets.endIndex).contains(pageIndex) else {
            return nil
        }
        return (index: pageIndex, offset: pageOffsets[pageIndex])
    }

    private func nextPage(for page: Page, in pageOffsets: [CGFloat]) -> Page? {
        let pageIndex = pageOffsets.index(after: page.index)
        guard (pageOffsets.startIndex..<pageOffsets.endIndex).contains(pageIndex) else {
            return nil
        }
        return (index: pageIndex, offset: pageOffsets[pageIndex])
    }

}
