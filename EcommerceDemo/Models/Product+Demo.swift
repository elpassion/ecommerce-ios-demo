import UIKit

extension Product {
    static let demos: [Product] = [.oculus, .surface, .xbox]
    static let oculus = Product(
        name: "Oculus Rift",
        price: "$1 299",
        color: .blackProduct,
        photo: .productOculus,
        specs: demoSpecs,
        descriptions: demoDescriptions
    )
    static let surface = Product(
        name: "Surface Pro 4",
        price: "$1 299",
        color: .blueProduct,
        photo: .productSurface,
        specs: demoSpecs,
        descriptions: demoDescriptions
    )
    static let xbox = Product(
        name: "xBox One",
        price: "$699",
        color: .greenProduct,
        photo: .productXbox,
        specs: demoSpecs,
        descriptions: demoDescriptions
    )
}

private let demoSpecs: [Product.Spec] = [
    .init(name: "diagonal", value: "12.3”", icon: .iconDiagonal),
    .init(name: "hard drive", value: "1TB", icon: .iconHardDrive),
    .init(name: "RAM", value: "16GB", icon: .iconRam)
]

// swiftlint:disable line_length

private let demoDescriptions: [Product.Description] = [
    .header("The tablet that can replace your laptop."),
    .text("Surface Pro 4 is light enough to take anywhere and powerful enough to use as a full desktop workstation."),
    .photo(.productSurfacePhoto),
    .text("Surface Pro 4 is meticulously crafted to be a powerful, ultrathin laptop — or a beautiful tablet that can stand on its own — all with up to 9 hours of video playback.")
]
