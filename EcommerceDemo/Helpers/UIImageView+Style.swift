import UIKit

extension UIImageView {
    static let productStyle: (UIImageView) -> Void = {
        $0.contentMode = .scaleAspectFit
    }
}
