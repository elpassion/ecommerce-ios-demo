import UIKit

struct GradientStyle {
    let colors: [GradientColor]
    let direction: GradientDirection
}

struct GradientColor {
    let location: Float
    let color: UIColor
}

struct GradientDirection {
    let startPoint: CGPoint
    let endPoint: CGPoint
}

extension GradientDirection {
    static var horizontal: GradientDirection {
        return GradientDirection(
            startPoint: CGPoint(x: 0, y: 0.5),
            endPoint: CGPoint(x: 1, y: 0.5)
        )
    }
}
