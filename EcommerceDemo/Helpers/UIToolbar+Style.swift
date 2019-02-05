import UIKit

extension UIToolbar {
    static let topStyle: (UIToolbar) -> Void = {
        $0.isTranslucent = false
        $0.setShadowImage(UIImage(), forToolbarPosition: .any)
    }
}
