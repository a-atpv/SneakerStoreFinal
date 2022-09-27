import UIKit
import SnapKit
import FirebaseFirestore
import FirebaseAuth

class Authorisation: UIViewController {
    let nextView = MainView.shared
    var user = User()
    
    let mail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Mail"
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
    
    let button: UIButton = ButtonFactory.buttonWithoutIcon(name: "Sing In", color: .black)
    
    @objc private func buttonDidPress() {
        self.allert.text = user.validation1(mail: mail.text!.trimmingCharacters(in: .whitespacesAndNewlines), password: password.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        if allert.text! == ""{
            print("Button was pressed!")
            user.signIn(mail: mail.text!, password: password.text!)
            transition()
        }

    }
    

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        view.addSubview(mail)
        mail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(140)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(password)
        password.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(204)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(allert)
        allert.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(380)
            make.width.equalTo(358)
            make.height.equalTo(48)
        }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(58)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(54)
        }

        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        
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

        
//        states.states = .signedIn
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let nav = UINavigationController(rootViewController: MainView())
//        UIWindow.switchRootViewController()
        

        
    }
    
}
