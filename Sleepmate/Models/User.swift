//
//  User.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 21.01.2023.
//

import Foundation

enum Gender {
    case man
    case woman
} // it is not a social network, so, I will not add some special gender types or case as "do not prefer to say"

class User {
    
    var name: String = ""
    var lastName: String = ""
    var username: String = ""
    var avatarLink: String?
    var gender: Gender
    
    init(name: String, lastName: String, username: String? = nil, avatarLink: String?, gender: Gender) {
        self.name = name
        self.lastName = lastName
        if let username = username {
            self.username = username
        }
        self.avatarLink = avatarLink
        self.gender = gender
    }
    
}
