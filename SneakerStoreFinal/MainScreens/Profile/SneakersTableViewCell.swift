import UIKit

class SneakersTableViewCell: UITableViewCell {
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(sneaker: SneakerModel) {
        self.image.image = UIImage(named: sneaker.image)
        self.brand.text = sneaker.brand
        self.name.text = sneaker.name
        self.price.text = "$ \(sneaker.price)"
        
        
    }
}


