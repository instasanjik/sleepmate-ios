//
//  Logger.swift
//  ARnums
//
//  Created by Sanzhar Koshkarbayev on 01.01.2023.
//

import Foundation

enum LogType: String {
    case error
    case warning
    case success
    case action
    case canceled
}

class Logger {
    
    static func log(_ logType:LogType,_ message:String){
        switch logType {
        case LogType.error:
            print("\(Date.dateTime) - 📕 Error: \(message)\n")
        case LogType.warning:
            print("\(Date.dateTime) - 📙 Warning: \(message)\n")
        case LogType.success:
            print("\(Date.dateTime) - 📗 Success: \(message)\n")
        case LogType.action:
            print("\(Date.dateTime) - 📘 Action: \(message)\n")
        case LogType.canceled:
            print("\(Date.dateTime) - 📓 Cancelled: \(message)\n")
        }
    }
    
    
}
