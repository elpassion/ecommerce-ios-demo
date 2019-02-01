import UIKit

extension UIView {

    // MARK: - Pin

    func layoutPinTop(to top: NSLayoutYAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: top, constant: margin).isActive = true
    }

    func layoutPinTop(greaterThan top: NSLayoutYAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(greaterThanOrEqualTo: top, constant: margin).isActive = true
    }

    func layoutPinBottom(to bottom: NSLayoutYAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: bottom, constant: -margin).isActive = true
    }

    func layoutPinBottom(lessThan bottom: NSLayoutYAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -margin).isActive = true
    }

    func layoutPinLeading(to leading: NSLayoutXAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: leading, constant: margin).isActive = true
    }

    func layoutPinLeading(greaterThan leading: NSLayoutXAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(greaterThanOrEqualTo: leading, constant: margin).isActive = true
    }

    func layoutPinTrailing(to trailing: NSLayoutXAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: trailing, constant: -margin).isActive = true
    }

    func layoutPinTrailing(lessThan trailing: NSLayoutXAxisAnchor, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(lessThanOrEqualTo: trailing, constant: margin).isActive = true
    }

    func layoutPinCenterX(to centerX: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: centerX).isActive = true
    }

    func layoutPinCenterY(to centerY: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: centerY).isActive = true
    }

    func layoutPinHeight(to height: NSLayoutDimension, multiplier: CGFloat = 1, delta: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: height, multiplier: multiplier, constant: delta).isActive = true
    }

    func layoutPinWidth(to width: NSLayoutDimension, multiplier: CGFloat = 1, delta: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: width, multiplier: multiplier, constant: delta).isActive = true
    }

    // MARK: - Center

    func layoutCenterHorizontally(in parent: LayoutGuideCompatible, margin: CGFloat = 0) {
        layoutPinLeading(greaterThan: parent.leadingAnchor, margin: margin)
        layoutPinTrailing(lessThan: parent.trailingAnchor, margin: margin)
        layoutPinCenterX(to: parent.centerXAnchor)
    }

    func layoutCenterVertically(in parent: LayoutGuideCompatible, margin: CGFloat = 0) {
        layoutPinTop(greaterThan: parent.topAnchor, margin: margin)
        layoutPinBottom(lessThan: parent.bottomAnchor, margin: margin)
        layoutPinCenterY(to: parent.centerYAnchor)
    }

    // MARK: - Fill

    func layoutFill(_ parent: LayoutGuideCompatible, margins: UIEdgeInsets = .zero) {
        layoutFillHorizontally(parent, leadingMargin: margins.left, trailingMargin: margins.right)
        layoutFillVerically(parent, topMargin: margins.top, bottomMargin: margins.bottom)
    }

    func layoutFillHorizontally(
        _ parent: LayoutGuideCompatible,
        leadingMargin: CGFloat = 0,
        trailingMargin: CGFloat = 0
    ) {
        layoutPinLeading(to: parent.leadingAnchor, margin: leadingMargin)
        layoutPinTrailing(to: parent.trailingAnchor, margin: trailingMargin)
    }

    func layoutFillVerically(
        _ parent: LayoutGuideCompatible,
        topMargin: CGFloat = 0,
        bottomMargin: CGFloat = 0
    ) {
        layoutPinTop(to: parent.topAnchor, margin: topMargin)
        layoutPinBottom(to: parent.bottomAnchor, margin: bottomMargin)
    }

}
