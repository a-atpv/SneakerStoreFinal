import UIKit

class Onboarding3: UIViewController {
    var nextView = WelcomePage()
    var fifthSneaker: UIImageView = ImageFactory.Image(name: "image 5", isHidden: false)
    var sixsSneaker: UIImageView = ImageFactory.Image(name: "image 6", isHidden: false)
    var vector3: UIImageView = ImageFactory.Image(name: "Vector 3", isHidden: false)
    var whiteCicle: UIImageView = ImageFactory.Image(name: "Ellipse 2", isHidden: false)
    var grayCicle1: UIImageView = ImageFactory.Image(name: "Ellipse 3", isHidden: false)
    var grayCicle2: UIImageView = ImageFactory.Image(name: "Ellipse 3", isHidden: false)
    
    var button: UIButton = ButtonFactory.buttonWithoutIcon(name: "Next", color: .black)
    
    @objc private func buttonDidPress() {
        print("Button was pressed!")
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(nextView, animated: true)
        
    }
    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        blurEffectView.layer.cornerRadius = 12
        vibrancyView.layer.cornerRadius = 12
        blurEffectView.contentView.addSubview(vibrancyView)
        
        return blurEffectView
    }()
    
    var mainText: UILabel = {
        let text = UILabel()
        text.text = "Fast shipping"
        text.textColor = .white
        text.font = .systemFont(ofSize: 28, weight: .bold)
        text.textAlignment = .center
        
        return text
    }()
    
    var smallText: UILabel = {
        let text = UILabel()
        text.text = "Get all of your desired sneakers in one place."
        text.textColor = .white
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textAlignment = .center
        
        return text
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        view.addSubview(fifthSneaker)
        fifthSneaker.snp.makeConstraints { make in
            make.top.equalToSuperview()
            
        }
        view.addSubview(sixsSneaker)
        sixsSneaker.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(59)
            make.trailing.equalToSuperview()
        }
        view.addSubview(vector3)
        vector3.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            
        }
        view.addSubview(blurEffectView)
        blurEffectView.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.height.equalTo(288)
            make.width.equalTo(390)
        }
        view.addSubview(mainText)
        mainText.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-174)
            make.centerX.equalToSuperview()
            make.height.equalTo(34)
            make.width.equalTo(358)
        }
        
        view.addSubview(smallText)
        smallText.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-136)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(358)
        }
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-58)
            make.height.equalTo(54)
            make.width.equalTo(358)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(whiteCicle)
        whiteCicle.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-248)
            make.centerX.equalToSuperview().offset(24)
        }
        view.addSubview(grayCicle1)
        grayCicle1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-248)
            make.centerX.equalToSuperview().offset(-24)
        }
        
        view.addSubview(grayCicle2)
        grayCicle2.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-248)
            make.centerX.equalToSuperview()
        }
    }
    
}



