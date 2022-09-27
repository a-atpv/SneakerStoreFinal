import UIKit
import SnapKit
import FirebaseFirestore
import FirebaseAuth

class Registration: UIViewController {
    let user = User()
    let nextView = MainView.shared
    let username: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let mail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Mail"
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let repeatPassword: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .continue
        textField.placeholder = "Repeat password"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .MyColors.GrayBG
        return textField
    }()
    
    let allert: UILabel = {
        let text = UILabel()
        text.text = ""
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textAlignment = .center
        return text
    }()
    
    let chevron: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chevron.left")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let button: UIButton = ButtonFactory.buttonWithoutIcon(name: "Sing Up", color: .black)
    
    @objc private func buttonDidPress() {
        print("Button was pressed!")
        
        self.allert.text = user.validation(username: username.text!.trimmingCharacters(in: .whitespacesAndNewlines), mail: mail.text!.trimmingCharacters(in: .whitespacesAndNewlines), password: password.text!.trimmingCharacters(in: .whitespacesAndNewlines), repeatPassword: repeatPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        if allert.text! == "" {
            user.addUser(username: username.text!.trimmingCharacters(in: .whitespacesAndNewlines), mail: mail.text!.trimmingCharacters(in: .whitespacesAndNewlines), password: password.text!.trimmingCharacters(in: .whitespacesAndNewlines))
            self.transition()
        }
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        view.addSubview(username)
        username.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(140)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(mail)
        mail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(password)
        password.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(260)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(repeatPassword)
        repeatPassword.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(320)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(58)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(54)
        }
        view.addSubview(allert)
        allert.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(380)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        
        view.addSubview(chevron)
        chevron.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.leading.equalToSuperview().offset(16)

        }
        chevron.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chevronTapped)))
        chevron.isUserInteractionEnabled = true

    
     
    }
    @objc func chevronTapped() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.popViewController(animated: true)
    }
    
    private func transition() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(self.nextView, animated: true)
        Storage.state = .signedIn

    }
}
