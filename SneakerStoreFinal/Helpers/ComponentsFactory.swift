import UIKit
import SnapKit

class ButtonFactory {
    
    static func buttonWithoutIcon(name: String, color: UIColor) -> UIButton {
        
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(name, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 1
        button.layer.cornerRadius = 20
        
        return button
    }
    static func smallButtonWithoutIcon(name: String, color: UIColor) -> UIButton {
        
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(name, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(15)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 1
        button.layer.cornerRadius = 20
        
        return button
    }
    
    
    static func buttonWithHeart(name: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle("🤍 " + name, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 1
        button.layer.cornerRadius = 20
        return button
    }
    
    static func smallButtonWithHeart(name: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle("🤍 " + name, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 1
        button.layer.cornerRadius = 16
        return button
    }
    
}

class ImageFactory {
    static func Image(name: String, isHidden: Bool) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.isHidden = isHidden
        return imageView
    }
}

class ProfileSettings {
    static func barWithArrow(text: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        let chevron = UIImageView()
        chevron.image = UIImage(named: "chevron")
        
        
        view.snp.makeConstraints { make in
            make.width.equalTo(390)
            make.height.equalTo(52)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(22)
            make.width.equalTo(280)
        }
        view.addSubview(chevron)
        chevron.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalToSuperview().offset(18)
        }
        view.isUserInteractionEnabled = false
        chevron.isUserInteractionEnabled = false
        return view
    }
    
    static func barWithLinkBox(text: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        let chevron = UIImageView()
        chevron.image = UIImage(named: "linkBox")
        
        
        view.snp.makeConstraints { make in
            make.width.equalTo(390)
            make.height.equalTo(52)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(22)
            make.width.equalTo(280)
        }
        view.addSubview(chevron)
        chevron.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalToSuperview().offset(18)
        }
        return view
    }
    
}

class ViewForCart{
    static func setup() -> UIView {
//    static func buttonWithSigns() -> UIView {
        let roundedRectangle: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            view.layer.cornerRadius = 20
            return view
        }()
        
        let amount: UILabel = {
            let amount = UILabel()
            amount.font = .systemFont(ofSize: 17, weight: .regular)
            amount.text = "1"
            amount.textColor = .white
            return amount
        }()
        
        let plusSign: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named:"plusSign")
            image.isUserInteractionEnabled = true
//            image.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(plusTapped)))
            return image
        }()
        
        let minusSign: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named:"minusSign")
            image.isUserInteractionEnabled = true
//            image.addGestureRecognizer(UIGestureRecognizer(target: ViewForCart.self, action: #selector(minusTapped)))
            return image
        }()
        roundedRectangle.snp.makeConstraints { make in
            make.width.equalTo(166)
            make.height.equalTo(36)
        }
        
        roundedRectangle.addSubview(plusSign)
        plusSign.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(44)
        }
        
        roundedRectangle.addSubview(minusSign)
        minusSign.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-44)
        }
        
        roundedRectangle.addSubview(amount)
        amount.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.centerY.equalToSuperview()
        }
        return roundedRectangle
    }
    
    static func circleWithSneaker(_ photo: String) -> UIView {
        let image = CircularImageView(image: UIImage(named: photo)?.resized(to: CGSize(width: 160, height: 160)))
        
        image.snp.makeConstraints { make in
            make.width.height.equalTo(300)

        }
        
        return image
    }
}


//    @objc func minusTapped() {
//        self.amount.text = String(Int(self.amount.text!)! - 1)
//    }
//
//    @objc func plusTapped() {
//        self.amount.text = String(Int(self.amount.text!)! + 1)
//    }

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        
        return image
    }
}

class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 10
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.MyColors.GrayBG.cgColor
        
    }
}

class CustomTapGestureRecognizer: UIButton {
    var sneakerIndex: String?
}

class OrderViews{
    static func smallPlate(text1: String, text2: String) -> UIView{
        let view: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()
        
        let label1: UILabel = {
            let label = UILabel()
            label.text = text1
            label.font = .systemFont(ofSize: 13, weight: .regular)
            return label
        }()
        
        let label2: UILabel = {
            let label = UILabel()
            label.text = text2
            label.textAlignment = .right
            label.font = .systemFont(ofSize: 13, weight: .semibold)
            return label
        }()
        
        view.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        view.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(240)
            make.width.equalTo(134)
            make.top.equalToSuperview().offset(16)
        }
        
        return view
    }
    
    static func bigPlate(sneaker: SneakerModel) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = .init(red: 0, green: 0, blue: 0.02, alpha: 1)
        
        let photo = UIImageView()
        photo.image = UIImage(named: sneaker.image)
        
        let brandName = UILabel()
        brandName.text = sneaker.brand
        brandName.font = .systemFont(ofSize: 13, weight: .regular)
        
        let text = UILabel()
        text.text = sneaker.name
        text.font = .systemFont(ofSize: 12, weight: .thin)
        
        let cost = UILabel()
        cost.text = "$ \(sneaker.price)"
        cost.font = .systemFont(ofSize: 12, weight: .bold)
        
        view.snp.makeConstraints { make in
            make.width.equalTo(174)
            make.height.equalTo(282)
        }
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(166)
            make.height.equalTo(166)
        }
        view.addSubview(brandName)
        brandName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.leading.equalToSuperview().inset(4)
        }
        view.addSubview(text)
        text.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(188)
            make.leading.equalToSuperview().inset(4)
        }
        view.addSubview(cost)
        cost.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(208)
            make.leading.equalToSuperview().inset(4)
        }
        
        return view
    }
    
}
