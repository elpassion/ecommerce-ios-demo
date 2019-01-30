import UIKit

extension UILabel {
    static let titleStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 20))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .white
    }
    static let productNameStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 32))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .darkText
    }
    static let priceStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 24))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = UIColor.darkText.withAlphaComponent(0.5)
    }
}
