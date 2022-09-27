import UIKit

class ProfileViewController: UIViewController {
    let user = User.shared
    let history = OrderHistory.shared
    let accInfo = ProfileSettings.barWithArrow(text: "Account Information")
    let orders = ProfileSettings.barWithArrow(text: "Order History")
    let shoeSize = ProfileSettings.barWithArrow(text: "Shoe size")
    let quetion1 = ProfileSettings.barWithLinkBox(text: "How to know your shoe size?")
    let quetion2 = ProfileSettings.barWithLinkBox(text: "How to check the authenticity of the shoe?")
    let button = ButtonFactory.buttonWithoutIcon(name: "Sign out", color: .black)
    
//    let circle = ViewForCart.circleWithSneaker("airforce1")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MyColors.GrayBG
        navigationItem.title = "Profile"
       
        
        view.addSubview(accInfo)
        accInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(114)
            make.centerX.equalToSuperview()
        }
        accInfo.isUserInteractionEnabled = true
        accInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(accInfoTap)))
        
        view.addSubview(orders)
        orders.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(182)
            make.centerX.equalToSuperview()
        }
        orders.isUserInteractionEnabled = true
        orders.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ordersTap)))
        
        view.addSubview(shoeSize)
        shoeSize.isUserInteractionEnabled = true
        shoeSize.addGestureRecognizer(.init(target: self, action: #selector(self.shoeSizeTap)))
        shoeSize.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
        }
        view.addSubview(quetion1)
        quetion1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(howTokwonShoeSizeTap)))
        quetion1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(318)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(quetion2)
        quetion2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(howToCheckAuthenticityTap)))
        quetion2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(370)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-104)
            make.centerX.equalToSuperview()
            make.height.equalTo(54)
            make.width.equalTo(358)
        }
        
    }
    

    @objc private func accInfoTap() {
        print("accInfo Tapped!")
        self.tabBarController?.moreNavigationController.isNavigationBarHidden = true
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(AccountInformation(), animated: true)
    }
    
    @objc private func ordersTap() {
        print("order Tapped!")
        self.tabBarController?.moreNavigationController.isNavigationBarHidden = true
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(OrderHistoryViewController(), animated: true)
   
    }
    
    @objc private func shoeSizeTap() {
        print("Button was pressed!")
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(ShoeSizeScreen(), animated: true)
    }
    
    @objc private func howTokwonShoeSizeTap() {
        print("Button was pressed!")
        openUrl(urlStr: "https://www.wikihow.com/Find-Your-Shoe-Size")
    }
    
    @objc private func howToCheckAuthenticityTap() {
        print("Button was pressed!")
        openUrl(urlStr: "https://www.wikihow.com/Spot-Fake-Nikes")
    }
    
    @objc func signOut() {
        user.signOut()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let nav = UINavigationController(rootViewController: WelcomePage())
        appDelegate.window!.rootViewController = nav
        Storage.state = .signedOut
        }
    
    func openUrl(urlStr: String) {
        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
        
    }

}

