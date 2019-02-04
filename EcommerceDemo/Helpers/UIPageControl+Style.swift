import UIKit

extension UIPageControl {
    static let defaultStyle: (UIPageControl) -> Void = {
        $0.pageIndicatorTintColor = .pageIndicator
        $0.currentPageIndicatorTintColor = .pageIndicatorActive
    }
}
