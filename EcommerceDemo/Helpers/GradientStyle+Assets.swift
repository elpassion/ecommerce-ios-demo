// swiftlint:disable object_literal
import UIKit

extension GradientStyle {
    static var button: GradientStyle {
        return GradientStyle(
            colors: [
                GradientColor(location: 0, color: UIColor(red: 0.933, green: 0.035, blue: 0.475, alpha: 1)),
                GradientColor(location: 1, color: UIColor(red: 1, green: 0.416, blue: 0, alpha: 1))
            ],
            direction: .horizontal
        )
    }
    static var bottomWhiteShade: GradientStyle {
        return GradientStyle(
            colors: [
                GradientColor(location: 0, color: UIColor.white.withAlphaComponent(0)),
                GradientColor(location: 1, color: .white)
            ],
            direction: .vertical
        )
    }
}
