import UIKit

class MainView: UITabBarController {
    static let shared = MainView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        self.tabBarController?.moreNavigationController.isNavigationBarHidden = true
        edgesForExtendedLayout = .top
        extendedLayoutIncludesOpaqueBars = true
        view.backgroundColor = .white
        tabBar.barTintColor = .white
        setupTabBar()
    }
    func setupTabBar() {
        let catalogViewController = UINavigationController(rootViewController: CatalogViewController())
        catalogViewController.tabBarItem.image = UIImage(named: "Vector1")
        catalogViewController.tabBarItem.selectedImage = UIImage(named: "Vector1.1")
        catalogViewController.tabBarItem.title = lables(text: "Catalog")

        
        let cartViewController = UINavigationController(rootViewController: CartViewController())
        cartViewController.tabBarItem.image = UIImage(named: "Vector2")
        cartViewController.tabBarItem.selectedImage = UIImage(named: "Vector2.1")
        cartViewController.tabBarItem.title = lables(text: "Cart")
 
        
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem.image = UIImage(named: "Vector3")
        profileViewController.tabBarItem.selectedImage = UIImage(named: "Vector3.1")
        profileViewController.tabBarItem.title = lables(text: "Profile")


        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        viewControllers = [catalogViewController, cartViewController, profileViewController]

    }
     
    func lables(text: String) -> String {
        let lable = UILabel()
        lable.text = text
        lable.font.withSize(10)
        lable.textColor = .MyColors.gray
        return lable.text!
    }
    

    
}

