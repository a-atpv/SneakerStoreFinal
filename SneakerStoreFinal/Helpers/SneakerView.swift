import UIKit

class SneakerView {
    static func sneakerView(_ sneaker: SneakerModel) -> UIView {
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
        
        let button = ButtonFactory.smallButtonWithoutIcon(name: "Add To Cart", color: .black)
        
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
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(166)
            make.height.equalTo(40)
        }
        
        
        return view
    }
}
