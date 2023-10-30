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
    @State private var presentedPokemon = NavigationPath()

    var body: some View {
        NavigationStack(path: $presentedPokemon) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...20, id: \.self) { value in
                        Button {
                            presentedPokemon.append("some")
                        } label: {
                            PokemonView()
                                .background(.blue)
                                .cornerRadius(15)
                                .padding(8)
                        }.buttonStyle(.plain)
                    }
                }
            }.navigationDestination(for: String.self) { pokemon in
                PokemonDetailView()
            }
        }.searchable(text: $searchText, prompt: "Search a Pokèmon")
    }
}

#Preview {
    PokemonListView()
}
