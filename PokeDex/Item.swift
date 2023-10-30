//
//  Item.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
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
