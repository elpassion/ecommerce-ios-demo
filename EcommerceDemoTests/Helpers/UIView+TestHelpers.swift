import UIKit

extension UIView {
    static func view(with sut: UIView, margin: CGFloat = 0) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sut)
        sut.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sut.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
            sut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            sut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            sut.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin)
        ])
        view.setNeedsLayout()
        view.layoutIfNeeded()
        return view
    }

    func snapshotImage(afterScreenUpdates: Bool = true) -> UIImage {
        return UIGraphicsImageRenderer(bounds: bounds).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
        }
    }
}
