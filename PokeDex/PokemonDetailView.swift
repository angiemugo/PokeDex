//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text("Pokemon")
        }
        List {
            Section(header: Text("Type")) {
                Text("some type")
            }

            Section(header: Text("Abilities")) {
                ForEach(1...5, id: \.self) {_ in 
                    Text("some ability")
                }
            }

            Section(header: Text("Moves")) {
                ForEach(1...20, id: \.self) {_ in 
                    Text("some move")
                }
            }

        }
    }
}

#Preview {
    PokemonDetailView()
}
