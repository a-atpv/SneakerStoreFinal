import UIKit
import SnapKit

class WelcomePage: UIViewController {
    let registrationView = Registration()
    let authorisationView = Authorisation()
    var firstSneaker: UIImageView = ImageFactory.Image(name: "Ellipse 7", isHidden: false)
    var secondSneaker: UIImageView = ImageFactory.Image(name: "Ellipse 6", isHidden: false)
    var vector1: UIImageView = ImageFactory.Image(name: "Vector 4", isHidden: false)
    
    var smallText: UILabel = {
        let text = UILabel()
        text.text = "I already have an account"
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textAlignment = .center
        return text
    }()
    
    var mainText: UILabel = {
        let text = UILabel()
        text.text = "Welcome to the biggest sneakers store app"
        text.font = .systemFont(ofSize: 28, weight: .bold)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()

    var button: UIButton = ButtonFactory.buttonWithoutIcon(name: "Sign Up", color: .black)
    
    @objc private func buttonDidPress() {
        print("Button was pressed!")
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(registrationView, animated: true)
    }
    
    @objc func authTap(sender: UITapGestureRecognizer) {
        print("Button was pressed!")
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(authorisationView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let tapForAuthetication = UITapGestureRecognizer(target: self, action: #selector(WelcomePage.authTap))
        smallText.isUserInteractionEnabled = true
        smallText.addGestureRecognizer(tapForAuthetication)
        
        view.addSubview(vector1)
        vector1.snp.makeConstraints { make in
            make.top.equalToSuperview()
          
        }
        
        view.addSubview(firstSneaker)
        firstSneaker.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(352)
            make.height.equalTo(228)
            make.width.equalTo(228)
        }
        
        view.addSubview(secondSneaker)
        secondSneaker.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(247)
            make.height.equalTo(246)
            make.width.equalTo(246)
        }
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-120)
            make.height.equalTo(54)
            make.width.equalTo(358)
            make.centerX.equalToSuperview()
        }
        view.addSubview(smallText)
        smallText.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-74)
            make.centerX.equalToSuperview()
            make.width.equalTo(318)
            make.height.equalTo(22)
        }
        
        view.addSubview(mainText)
        mainText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-198)
            make.width.equalTo(358)
            make.height.equalTo(68)
        }
    }
}
