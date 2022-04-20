//
//  User.swift
//  MobiX
//
//  Created by Sai Hari on 19/04/22.
//

import Foundation

class User {
    var mailID : String
    var password : String
    
    init(mail : String , pass : String) {
        self.mailID = mail
        self.password = pass
    }
}
