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
    static let roundButtonTitleStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 18))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .white
    }
    static let specNameStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 15))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .darkText
    }
    static let specValueStyle: (UILabel) -> Void = {
        $0.font = UIFontMetrics.default.scaledFont(for: .varelaRound(size: 24))
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .darkText
    }

    static func setText(_ text: String?) -> (UILabel) -> Void {
        return { $0.text = text }
    }
}
