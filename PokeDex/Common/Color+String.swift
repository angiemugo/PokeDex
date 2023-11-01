//
//  Color+String.swift
//  PokeDex
//
//  Created by Angie Mugo on 01/11/2023.
//

import SwiftUI

extension String {
    func color() -> Color {
        let colorNameMapping: [String: Color] = [
            "black": .black,
            "white": .white,
            "gray": .gray,
            "red": .red,
            "green": .green,
            "blue": .blue,
            "cyan": .cyan,
            "yellow": .yellow,
            "pink": .pink,
            "purple": .purple,
            "brown": .brown
        ]

        return colorNameMapping[self] ?? .clear
    }
}

