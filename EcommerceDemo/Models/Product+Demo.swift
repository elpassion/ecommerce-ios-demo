// swiftlint:disable line_length
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
        ],
        description: [
            .text("Surface Pro 4 is light enough to take anywhere and powerful enough to use as a full desktop workstation."),
            .text("Surface Pro 4 is meticulously crafted to be a powerful, ultrathin laptop — or a beautiful tablet that can stand on its own — all with up to 9 hours of video playback.")
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
        ],
        description: [
            .text("Surface Pro 4 is light enough to take anywhere and powerful enough to use as a full desktop workstation."),
            .text("Surface Pro 4 is meticulously crafted to be a powerful, ultrathin laptop — or a beautiful tablet that can stand on its own — all with up to 9 hours of video playback.")
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
        ],
        description: [
            .text("Surface Pro 4 is light enough to take anywhere and powerful enough to use as a full desktop workstation."),
            .text("Surface Pro 4 is meticulously crafted to be a powerful, ultrathin laptop — or a beautiful tablet that can stand on its own — all with up to 9 hours of video playback.")
        ]
    )
}
