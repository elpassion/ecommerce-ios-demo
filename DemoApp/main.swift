import EcommerceDemo
import UIKit

registerFonts(from: EcommerceDemo.bundle)

let appDelegateClass: AnyClass = NSClassFromString("EcommerceDemoTests.AppDelegateDouble") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
