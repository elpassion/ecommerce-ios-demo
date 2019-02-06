import UIKit

extension UIToolbar {
    static let topStyle: (UIToolbar) -> Void = {
        $0.setShadowImage(UIImage(), forToolbarPosition: .any)
        $0.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: UIBarMetrics.default)
    }
}
