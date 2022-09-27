import UIKit
import SnapKit

class CartTableViewCell: UITableViewCell {
//    static let identifier = "CartTableViewCell"
    
    let image : UIImageView = {
        let photo = UIImageView()
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
        cost.font = .systemFont(ofSize: 12, weight: .bold)
        return cost
    }()
    
    let button = ViewForCart.setup()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(140)
        }
        
        self.addSubview(brand)
        brand.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.leading.equalToSuperview().offset(172)
        }
        
        self.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(41)
            make.leading.equalToSuperview().offset(172)
        }
        
        self.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(77)
            make.leading.equalTo(name).offset(4)
        }
        
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(price.snp_bottomMargin).offset(10)
            make.leading.equalToSuperview().offset(172)
            make.width.equalTo(166)
            make.height.equalTo(36)
        }
        
        
    }
    
    func configure(sneaker: SneakerModel) {
        self.name.text = sneaker.name
        self.brand.text = sneaker.brand
        self.price.text = "$ \(sneaker.price)"
        self.image.image = UIImage(named: sneaker.image)
    }

}
