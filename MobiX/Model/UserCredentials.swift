//
//  UserCredentials.swift
//  MobiX
//
//  Created by Sai Hari on 19/04/22.
//

import Foundation
class UserCredentials {
    var users = [User]()
    
    init() {
        users.append(User(mail: "saihari@mobicip.com", pass: "1234"))
        users.append(User(mail: "akilan@mobicip.com", pass: "5678"))
    }
    
}
