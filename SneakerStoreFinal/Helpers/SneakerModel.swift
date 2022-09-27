import Foundation

struct SneakerModel {
    var name: String
    var brand: String
    var price: Int
    var image: String
    var sneakerID: String
    
    init (name: String, brand: String, price: Int, image: String, sneakerID: String) {
        self.name = name
        self.brand = brand
        self.price = price
        self.image = image
        self.sneakerID = sneakerID
    }
    
    init (dictionary: [String : Any], sneakerID: String) {
        name = dictionary["name"] as? String ?? " "
        brand = dictionary["brand"] as? String ?? " "
        price = dictionary["price"] as? Int ?? 10000
        image = dictionary["image"] as? String ?? " "
        self.sneakerID = sneakerID
        
    }
    
    func toDictionary() -> [String : Any] {
        let dict: [String : Any] = ["name" : name, "brand" : brand, "price" : price, "image" : image, "sneakerID" : sneakerID]
        return dict
    }
    
    
    
}

