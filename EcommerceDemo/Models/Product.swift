import UIKit

struct Product {
    let name: String
    let price: String
    let color: UIColor
    let image: UIImage
}

extension Product {
    static let oculus = Product(
        name: "Oculus Rift",
        price: "$1 299",
        color: .blackProduct,
        image: .productOculus
    )
    static let surface = Product(
        name: "Surface Pro 4",
        price: "$1 299",
        color: .blueProduct,
        image: .productSurface
    )
    static let xbox = Product(
        name: "xBox One",
        price: "$699",
        color: .greenProduct,
        image: .productXbox
    )
}
