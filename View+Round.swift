//
//  View+Round.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

extension View {
    func roundEdges(backgroundColor: some View = Color.clear, lineColor: Color = .gray, cornerRadius: CGFloat = 20) -> some View {
        modifier(RoundedRect(radius: cornerRadius,
                             borderColor: lineColor,
                             backgroundColor: backgroundColor))
    }
}
