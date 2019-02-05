import UIKit

extension Product {
    static let demos: [Product] = [.oculus, .surface, .xbox]
    static let oculus = Product(
        name: "Oculus Rift",
        price: "$1 299",
        color: .blackProduct,
        photo: .productOculus,
        specs: [
            Spec(name: "diagonal", value: "12.3”", icon: .iconDiagonal),
            Spec(name: "hard drive", value: "1TB", icon: .iconHardDrive),
            Spec(name: "RAM", value: "16GB", icon: .iconRam)
        ]
    )
    static let surface = Product(
        name: "Surface Pro 4",
        price: "$1 299",
        color: .blueProduct,
        photo: .productSurface,
        specs: [
            Spec(name: "diagonal", value: "12.3”", icon: .iconDiagonal),
            Spec(name: "hard drive", value: "1TB", icon: .iconHardDrive),
            Spec(name: "RAM", value: "16GB", icon: .iconRam)
        ]
    )
    static let xbox = Product(
        name: "xBox One",
        price: "$699",
        color: .greenProduct,
        photo: .productXbox,
        specs: [
            Spec(name: "diagonal", value: "12.3”", icon: .iconDiagonal),
            Spec(name: "hard drive", value: "1TB", icon: .iconHardDrive),
            Spec(name: "RAM", value: "16GB", icon: .iconRam)
        ]
    )
}
