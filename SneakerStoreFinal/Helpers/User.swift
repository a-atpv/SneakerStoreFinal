import Foundation
import FirebaseFirestore
import FirebaseAuth
import UIKit

class User {
    static let shared = User()
    let db: Firestore!
    let auth: Auth!
    var userId = ""
//    let states = States1()
    
    init() {
        self.db = Firestore.firestore()
        self.auth = Auth.auth()
    }
    
    
    func addUser(username: String, mail:String ,password: String) {
        let db = Firestore.firestore()
        let auth = Auth.auth()
        
        auth.createUser(withEmail: mail, password: password) { result, errror in
            if errror != nil {
                print(errror as Any)
                print("Fail during user creation")
            } else{
                self.db.collection("users").document(self.auth.currentUser!.uid).setData(["name" : username, "mail" : mail, "password" : password])
                self.userId = self.auth.currentUser!.uid
   
            }
        }
    }
    
    func signIn(mail: String, password: String) {
        let auth = Auth.auth()
        
        auth.signIn(withEmail: mail, password: password) { result, error in
            if error != nil {
                print(error as Any)
            } else {
                self.userId = auth.currentUser!.uid
            }
        }
    }
    
    func signOut() {
        let auth = Auth.auth()
        try! auth.signOut()

    }

    
    func validation1(mail: String, password: String) -> String {
        
        if  mail.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill all forms!"
            
        }
        return ""
    }
    
    
    func validation(username: String, mail: String, password: String, repeatPassword: String) -> String {
        
        if username.trimmingCharacters(in: .whitespacesAndNewlines) == "" || mail.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" || repeatPassword.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill all forms!"
        }
        if isValidEmail(mail) == false {
            return "Enter valid mail adress!"
        }
        if isPasswordValid(password) == false {
            return "Your password is not strong enough!"
        }
        if password != repeatPassword {
            return "Passwords do not math!"
        }
        return ""
    }
    
    private func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    private func isValidEmail(_ mail :String) -> Bool {
        let mailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return mailTest.evaluate(with: mail)

    }
    
}
