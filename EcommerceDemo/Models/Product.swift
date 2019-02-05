import UIKit

struct Product {
    struct Spec {
        let name: String
        let value: String
        let icon: UIImage
    }

    enum Description {
        case header(String)
        case text(String)
        case photo(UIImage)
    }

    let name: String
    let price: String
    let color: UIColor
    let photo: UIImage
    let specs: [Spec]
    let descriptions: [Description]
}
