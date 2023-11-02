//
//  FirebaseFirestoreModel.swift
//  Clan
//
//  Created by Mubeen Riaz on 02/11/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseFirestoreModel: ObservableObject{
    
    private var fStoreDB: Firestore? = nil
    static let sharedInstance = FirebaseFirestoreModel()
    
    private init(){
        fStoreDB = Firestore.firestore()
    }
    
    
    func sendMesssage(msgBody: String, completion:@escaping (Bool, String) -> Void){
        if let db = fStoreDB{
            db.collection(Constants.FStore.collectionName)
                .addDocument(data: [
                    Constants.FStore.senderField:  FirebaseAuthModel.getLoggedInUser()?.email,
                    Constants.FStore.bodyField: msgBody,
                    Constants.FStore.timeField: Date().timeIntervalSince1970
                ]) { (error) in
                    if let e = error{
                        completion(false,e.localizedDescription)
                        //self.showAlertDialog(title: "Error", message: "Error sending message")
                    }else{
                        completion(true,"Message sent")
                    }
                    
                }
        }
    }
    

}
