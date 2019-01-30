import UIKit

extension UIScrollView {
    var viewport: CGRect {
        return CGRect(
            origin: CGPoint(
                x: contentOffset.x + adjustedContentInset.left,
                y: contentOffset.y + adjustedContentInset.top
            ),
            size: CGSize(
                width: frame.width - adjustedContentInset.horizontal,
                height: frame.height - adjustedContentInset.vertical
            )
        )
    }
}
