import Foundation
import FirebaseFirestore
import FirebaseAuth

class Cart {
    static let shared = Cart()
    let db:  Firestore!
    let auth: Auth!
    let userModel = User.shared
    var sneakersArray = [SneakerModel]()
//    lazy var user = db.collection("users").document(auth.currentUser!.uid)
//    lazy var orderHistory = user.collection("orderHistory")
    let orders = OrderHistory.shared
    var orderNumber = 0

    
    init () {
        self.db = Firestore.firestore()
        self.auth = Auth.auth()
    }
    
    func addData(sneaker: SneakerModel) {
        let user = db.collection("users").document(auth.currentUser!.uid)
        user.collection("cart").addDocument(data: sneaker.toDictionary()) { error in
            if error != nil {
                print(error as Any)
            }
        }
    }
    
    func getData(completion: @escaping () -> ()) {
        let user = db.collection("users").document(auth.currentUser!.uid)
        user.collection("cart").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error as Any)
            } else {
                self.sneakersArray = []
                for document in snapshot!.documents {
                    let sneaker = SneakerModel(dictionary: document.data(), sneakerID: document.documentID)
                    print(sneaker)
                    self.sneakersArray.append(sneaker)
                }
                completion()
            }
        }
    }
    
    func deleteData(sneaker: SneakerModel) {
        
        let user = db.collection("users").document(auth.currentUser!.uid)
        user.collection("cart").document(sneaker.sneakerID).delete()
    }
    
    
    func sendToHistory(order: Order) {
        let user = db.collection("users").document(auth.currentUser!.uid)
        let orderHistory = user.collection("orderHistory")
        var documentID: String
        
        documentID = orderHistory.addDocument(data: ["date" : order.date, "price" : order.price, "quantity" : order.quantity]).documentID
        
        
        for sneaker in order.sneakers{
            orderHistory.document(documentID).collection("sneakers").addDocument(data: sneaker.toDictionary())
        }
    }
    
    
//    func sendData(sneakers: [SneakerModel], date: String, price: Int, quantity: Int) {
//        let user = db.collection("users").document(auth.currentUser!.uid)
//        let orderHistory = user.collection("orderHistory")
//        orderHistory.document("\(self.orderNumber)").setData(["date" : date, "price" : price, "quantity" : quantity])
//        
//        for sneaker in self.sneakersArray {
//            orderHistory.document("\(self.orderNumber)").collection("sneakers").addDocument(data: sneaker.toDictionary())
//        }
//        self.orderNumber  = self.orderNumber + 1
//    }
}


