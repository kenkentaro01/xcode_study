//
//  Item.swift
//  kentaro nagata
//
//  Created by 健太郎 on 2024/01/14.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
