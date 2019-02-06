import UIKit

extension UIBarButtonItem {
    static var close: UIBarButtonItem {
        let item = UIBarButtonItem(image: UIImage.iconX, style: .plain, target: nil, action: nil)
        item.tintColor = .white
        return item
    }
    static var flexibleSpace: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
    static var star: UIBarButtonItem {
        let item = UIBarButtonItem(image: UIImage.iconStar, style: .plain, target: nil, action: nil)
        item.tintColor = .white
        return item
    }
}
