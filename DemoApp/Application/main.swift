import UIKit

let appDelegateClass: AnyClass = NSClassFromString("DemoAppTests.AppDelegateDouble") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
