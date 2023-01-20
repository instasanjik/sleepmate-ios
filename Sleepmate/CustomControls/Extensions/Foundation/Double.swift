//
//  Double.swift
//  ARnums
//
//  Created by Sanzhar Koshkarbayev on 12.01.2023.
//

import Foundation

extension Double {
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}
