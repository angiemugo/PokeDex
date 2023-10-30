//
//  PokemonListView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

struct PokemonListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...20, id: \.self) { value in
                        PokemonView()
                            .background(.blue)
                            .cornerRadius(15)
                            .padding(8)
                    }
                }
            }
        }.searchable(text: $searchText, prompt: "Search a Pokèmon")
    }
}

#Preview {
    PokemonListView()
}
