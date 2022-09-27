import Foundation
import FirebaseFirestore

class Sneakers {
    var sneakersArray = [SneakerModel]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completion: @escaping () -> ()) {
        db.collection("sneakers").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error as Any)
                completion()
            } else {
                if snapshot != nil {
                    self.sneakersArray = []
                    for document in snapshot!.documents {
                        let sneaker = SneakerModel(dictionary: document.data(), sneakerID: document.documentID)
//                        print(sneaker)
                        self.sneakersArray.append(sneaker)
                    }
                    completion()
                }
            }
        }
    }
}
