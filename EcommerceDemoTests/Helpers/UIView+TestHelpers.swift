import UIKit

extension UIView {
    func constrained(to size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ])
        return self
    }
}

func aView(with sut: UIView) -> UIView {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(sut)
    sut.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        sut.topAnchor.constraint(equalTo: view.topAnchor),
        sut.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        sut.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        sut.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    view.setNeedsLayout()
    view.layoutIfNeeded()
    return view
}
