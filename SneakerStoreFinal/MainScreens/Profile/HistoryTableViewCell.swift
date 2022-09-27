import UIKit

class HistoryTableViewCell: UITableViewCell {
    let history = OrderHistory.shared
    
    let square: UIView = {
        let view = UIView()
        view.backgroundColor = .MyColors.lightGray
        return view
    }()
    
    let orderNumber: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let orderDate: UILabel = {
        let date = UILabel()
        date.font = .systemFont(ofSize: 12, weight: .thin)
        return date
    }()
    
    let price: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 12, weight: .bold)
        return price
    }()
    
    
    var image : UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    var photo = CircularImageView()


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        self.addSubview(square)
        square.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(100)
        }
        
        self.addSubview(orderNumber)
        orderNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(square.snp_trailingMargin).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(22)
        }
        
        self.addSubview(orderDate)
        orderDate.snp.makeConstraints { make in
            make.top.equalTo(orderNumber.snp_bottomMargin).offset(4)
            make.leading.equalTo(square.snp_trailingMargin).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(16)
        }
        
        self.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalTo(orderDate.snp_bottomMargin).offset(16)
            make.leading.equalTo(square.snp_trailingMargin).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(16)
        }
        
        self.addSubview(photo)
            photo.snp.makeConstraints { make in
                make.centerX.centerY.equalTo(square)
                make.width.height.equalTo(44)
            }
        
    
    }
    func configure(order: Order) {
        history.getSneakers(docuementID: order.ID) {
        self.orderNumber.text = "Order #1"
        self.orderDate.text = order.date
        self.price.text = "\(order.quantity) items • $\(order.price)"
        self.photo.image = UIImage(named: self.history.sneakersArray[0].image)?.resized(to: CGSize(width: 44, height: 44))
        }
            
//        print(order.sneakers[0])
        }

}
