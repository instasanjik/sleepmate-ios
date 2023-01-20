//
//  Date.swift
//  ARnums
//
//  Created by Sanzhar Koshkarbayev on 01.01.2023.
//

import Foundation

extension Date {
    static var dateTime: String {
        get {
            return Date.now.ISO8601Format()
        }
    }
}
