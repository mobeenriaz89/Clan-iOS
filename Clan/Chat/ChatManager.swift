//
//  ChatManager.swift
//  Clan
//
//  Created by Mubeen Riaz on 02/11/2023.
//

import Foundation
import FirebaseFirestore

class ChatManager: ObservableObject {
    
    @Published var msgsList = [MessageDataModel]()
    let db = Firestore.firestore()
    
    func getMsgsList(){
            db.collection(Constants.FStore.collectionName)
                .order(by: Constants.FStore.timeField)
                .addSnapshotListener{ (querySnapshot, error) in
                    self.msgsList = []
                    if let e = error{
                        print("Error loading previous messages \(e)")
                    }else{
                        if let documents = querySnapshot?.documents{
                            for doc in documents{
                                let data = doc.data()
                                if let msgSender = data[Constants.FStore.senderField] as? String,
                                   let msgBody = data[Constants.FStore.bodyField] as? String{
                                    let newMesssage = MessageDataModel(msgId: UUID().uuidString, body: msgBody, sender: msgSender)
                                    self.msgsList.append(newMesssage)
                                }
                            }
                        }
                    }
                }
    }
}
