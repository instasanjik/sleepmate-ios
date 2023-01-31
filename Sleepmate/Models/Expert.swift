//
//  Expert.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 30.01.2023.
//

import Foundation

class Expert: User {
    
    var shortDesctiprion: String
    var workExperience: Int // days
//    var clinic: Clinic
//    var bio: String
    
    init(name: String, lastName: String, username: String? = nil, avatarLink: String?, gender: Gender, shortDesctiprion: String, workExpitience: Int) {
        self.shortDesctiprion = shortDesctiprion
        self.workExperience = workExpitience
        super.init(name: name, lastName: lastName, avatarLink: avatarLink, gender: gender)
    }
    
    
}
