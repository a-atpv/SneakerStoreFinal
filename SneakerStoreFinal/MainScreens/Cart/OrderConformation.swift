//
//  OrderConformation.swift
//  SneakerStoreFinal
//
//  Created by Алдияр Айтпаев on 26.07.2022.
//

import UIKit

class OrderConformation: UIViewController {
    let cart = Cart.shared
    let vector: UIImageView = ImageFactory.Image(name: "Vector 9", isHidden: false)
    var button: UIButton = ButtonFactory.buttonWithoutIcon(name: "Get back to shopping", color: .black)
    lazy var sneaaker = ViewForCart.circleWithSneaker(cart.sneakersArray[0].image)
    let view1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        return view
    }()
    
    let text: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 28, weight: .bold)
        text.textAlignment = .left
        text.numberOfLines = 3
        text.text = "Your order is succesfully placed. Thanks!"
        return text
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MyColors.GrayBG
        
        view.snp.makeConstraints { make in
            make.width.equalTo(390)
            make.height.equalTo(538)
        }
        view.addSubview(text)
        text.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-135)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
        }
        
        
        view.addSubview(sneaaker)
        sneaaker.snp.makeConstraints { make in
            make.bottom.equalTo(text.snp_topMargin).offset(-20)
            make.trailing.equalToSuperview().offset(-60)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        if cart.sneakersArray.count > 1 {
            let sneaker2 = ViewForCart.circleWithSneaker(cart.sneakersArray[1].image)
            view.addSubview(sneaker2)
            sneaker2.snp.makeConstraints { make in
                make.bottom.equalTo(sneaaker.snp_bottomMargin).offset(-60)
                make.trailing.equalTo(sneaaker.snp_trailingMargin).offset(-108)
                make.width.equalTo(150)
                make.height.equalTo(150)
            }
        }
        
        view.addSubview(vector)
        vector.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-58)
            make.centerX.equalToSuperview()
            make.height.equalTo(54)
            make.width.equalTo(358)
        }
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
    }
    @objc func buttonDidPress() {
        print("Button was pressed!")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
        
}
