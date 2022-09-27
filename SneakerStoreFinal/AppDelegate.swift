import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        window?.makeKeyAndVisible()
//        self.window?.rootViewController = UINavigationController(rootViewController: WelcomePage())
//        Storage.state = .firstLaunch
        if Storage.state == .firstLaunch {
            self.window?.rootViewController = UINavigationController(rootViewController: Onboarding1())
        }
        if Storage.state == .signedIn {
            self.window?.rootViewController = UINavigationController(rootViewController: MainView())
        }
        if Storage.state == .signedOut {
            self.window?.rootViewController = UINavigationController(rootViewController: WelcomePage())
        }
        
        return true
    }
    
}



extension UIWindow {
    
    func switchRootViewController(_ viewController: UIViewController) {

            rootViewController = viewController

    }
    
}
