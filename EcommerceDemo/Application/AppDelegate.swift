import UIKit

public class AppDelegate: UIResponder, UIApplicationDelegate {

    var viewControllerFactory: DealsViewControllerCreating = DealsViewControllerFactory()

    // MARK: UIApplicationDelegate

    public var window: UIWindow?

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewControllerFactory.create(with: Product.demos)
        window?.makeKeyAndVisible()
        return true
    }

}
