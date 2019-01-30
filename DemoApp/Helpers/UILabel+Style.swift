import UIKit

extension UILabel {
    static let titleStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 20))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .white
    }
}
