import UIKit

extension LayoutGuideCompatible {

    // MARK: - Fill

    func layoutFillVerically(subviews: [(view: UIView, heightMultiplier: CGFloat?)]) {
        subviews.enumerated().forEach { index, item in
            item.view.layoutFillHorizontally(self)
            if index == subviews.startIndex {
                item.view.layoutPinTop(to: topAnchor)
            } else {
                let previous = subviews[subviews.index(before: index)]
                item.view.layoutPinTop(to: previous.view.bottomAnchor)
            }
            if index == subviews.index(before: subviews.endIndex) {
                item.view.layoutPinBottom(to: bottomAnchor)
            }
            if let multiplier = item.heightMultiplier {
                item.view.layoutPinHeight(to: heightAnchor, multiplier: multiplier)
            }
        }
    }

}
