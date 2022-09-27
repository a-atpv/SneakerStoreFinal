//
//  SneakerCollectionViewCell.swift
//  SneakerStoreApp
//
//  Created by Алдияр Айтпаев on 21.03.2022.
//

import UIKit

class SneakerCollectionViewCell: UICollectionViewCell {
    static let identifier = "SneakerCollectionViewCell"
    
    let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = .init(red: 0, green: 0, blue: 0.02, alpha: 1)
        return view
    }()
    
    let image : UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "airforce1")
        
        return photo
    }()
    
    let brand: UILabel = {
        let brandName = UILabel()
        brandName.font = .systemFont(ofSize: 13, weight: .regular)
        return brandName
    }()
    
    let name: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 12, weight: .thin)
        return text
    }()
    
    let price: UILabel = {
        let cost = UILabel()
//        cost.text = "$ \(sneaker.price)"
        cost.font = .systemFont(ofSize: 12, weight: .bold)
        return cost
    }()
    
    let button = ButtonFactory.smallButtonWithoutIcon(name: "Add To Cart", color: .black)
    
    var buttonAction: ((Any) -> Void)?

        @objc func buttonPressed(sender: Any) {
            self.buttonAction?(sender)
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.isUserInteractionEnabled = true
        self.addSubview(background)
        background.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(282)
            make.width.equalTo(174)
        }
        
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(166)
            make.height.equalTo(166)
        }
        self.addSubview(brand)
        brand.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.leading.equalToSuperview().inset(4)
        }
        self.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(188)
            make.leading.equalToSuperview().inset(4)
        }
        self.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(208)
            make.leading.equalToSuperview().inset(4)
        }
        self.addSubview(button)
        button.isUserInteractionEnabled = true
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(166)
            make.height.equalTo(40)
        }
        
        
        
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = button.hitTest(button.convert(point, from: self), with: event)
        if view == nil {
            view = super.hitTest(point, with: event)
        }

        return view
    }
    
    func configure(_ sneaker: SneakerModel) {
        self.name.text = sneaker.name
        self.brand.text = sneaker.brand
        self.price.text = "$ \(sneaker.price)"
        self.image.image = UIImage(named: sneaker.image)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
