import Foundation

struct Order{
    var sneakers: [SneakerModel]
    var date: String
    var quantity: Int
    var price: Int
    var ID: String
    
    init(sneakers: [SneakerModel], date: String, quatity: Int, price: Int, ID: String) {
        self.sneakers = sneakers
        self.date = date
        self.quantity = quatity
        self.price = price
        self.ID = ID
        
    }
    
    
    init (sneakers: [SneakerModel], dictionary: [String : Any], ID: String) {
        self.sneakers = sneakers
        date = dictionary["date"] as? String ?? ""
        quantity = dictionary["quantity"] as? Int ?? 0
        price = dictionary["price"] as? Int ?? 0
        self.ID = ID
    }
}
