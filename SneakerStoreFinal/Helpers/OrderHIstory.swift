import Foundation
import FirebaseFirestore
import FirebaseAuth

class OrderHistory {
    static let shared = OrderHistory()
    private let userModel = User.shared
    private let db: Firestore!
    private let auth: Auth!
    private lazy var user = db.collection("users").document(auth.currentUser!.uid)
    private lazy var orderHistory = user.collection("orderHistory")
   
    var ordersArray = [Order]()
    var sneakersArray = [SneakerModel]()
    
    var sneakerDict = [String : [SneakerModel]]()
    
    init() {
        self.db = Firestore.firestore()
        self.auth = Auth.auth()
    }
    
    func getSneakers(docuementID: String, completion: @escaping() -> ()) {
        self.orderHistory.document(docuementID).collection("sneakers").getDocuments{ snapshot,  error in
            if error != nil {
                print(error as Any)
            } else {
//                print("adding sneakers")
                self.sneakersArray = []
                for document in snapshot!.documents {
                    let sneaker = SneakerModel(dictionary: document.data(), sneakerID: document.documentID)
                    self.sneakersArray.append(sneaker)
//                    print(sneaker)
//                    print(self.ordersArray[i].sneakers)
                }
            }
            completion()
        }

    }
    

    func getData(completion: @escaping () -> ()) {
        //        let user = db.collection("users").document(auth.currentUser!.uid)
        self.orderHistory.addSnapshotListener { snapshot, error in
            if error != nil {
                print(error as Any)
            } else {
                self.ordersArray = []
                for document in snapshot!.documents {
                    
                    let order = Order(sneakers: self.sneakersArray, dictionary: document.data(), ID: document.documentID)
//                                            print(order)
                    self.ordersArray.append(order)
                    
//                    self.getSneakers(docuementID: document.documentID) {
//                        let order = Order(sneakers: self.sneakersArray, dictionary: document.data(), ID: document.documentID)
////                                            print(order)
//                        self.ordersArray.append(order)
//                    }
//                    print(self.ordersArray)
                }
            }
            completion()
        }
    }
}
