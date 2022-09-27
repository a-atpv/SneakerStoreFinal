import UIKit

class AccountInformation: UIViewController {
    let previousVC = MainView.shared

    let username: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let repeatPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Repeat Password"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    var chevron: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chevron.left")
        image.addGestureRecognizer(UITapGestureRecognizer(target: AccountInformation.self, action: #selector(AccountInformation.chevronTapped)))
        image.isUserInteractionEnabled = true
        return image
    }()
    
    
    
    let button = ButtonFactory.buttonWithoutIcon(name: "Save changes", color: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.backButtonTitle = "<"
//        navigationItem.title = "Acount information"
        view.backgroundColor = .white
        
        
        
        view.addSubview(username)
        username.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(104)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(password)
        password.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(repeatPassword)
        repeatPassword.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(232)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-104)
            make.centerX.equalToSuperview()
            make.height.equalTo(54)
            make.width.equalTo(358)
        }
        button.addTarget(self, action: #selector(chevronTapped), for: .touchUpInside)
        
        view.addSubview(chevron)
        chevron.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(355)
            make.leading.equalToSuperview().offset(16)

        }
        chevron.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AccountInformation.chevronTapped)))
        chevron.isUserInteractionEnabled = true


    }
    
    @objc func chevronTapped(sender: CustomTapGestureRecognizer) {
        //        navigationController?.isNavigationBarHidden = true
//        print(sender.sneakerIndex as Any)
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
