// swiftlint:disable force_unwrapping
import UIKit

func registerFonts(from bundle: Bundle) {
    let fontUrls = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil)!
    fontUrls.forEach { url in
        let fontDataProvider = CGDataProvider(url: url as CFURL)!
        let font = CGFont(fontDataProvider)!
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            fatalError("Could not register font from url \(url), error: \(error!.takeUnretainedValue())")
        }
    }
}
