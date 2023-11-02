//
//  MessageDataModel.swift
//  Clan
//
//  Created by Mubeen Riaz on 02/11/2023.
//

import Foundation

struct MessageDataModel: Decodable, Identifiable{
    var id: String{
        return msgId
    }
    var msgId: String
    var body: String?
    var sender: String?
}
