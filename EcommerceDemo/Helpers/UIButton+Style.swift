import UIKit

extension UIButton {
    static let closeStyle: (UIButton) -> Void = {
        $0.setImage(UIImage.iconX, for: .normal)
        $0.layoutPinWidth(to: 44)
        $0.layoutPinHeight(to: 44)
    }
}
