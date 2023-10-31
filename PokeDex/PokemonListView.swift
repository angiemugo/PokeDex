//
//  PokemonListView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI
import PokedexAPI

struct PokemonListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var searchText: String = ""
    @State private var presentedPokemon = NavigationPath()
    @State private var filters = Set<String>()
    @StateObject private var viewModel = PokemonsViewModel()

    var body: some View {
        NavigationStack(path: $presentedPokemon) {
            VStack {
                Text("Use the advanced search to find the Pokèmon by type, weakness, ability and more!").padding([.horizontal])
                SearchView(searchText: $searchText, filters: $filters)
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<viewModel.pokemons.count, id: \.self) { index in
                            let selectedPokemon = viewModel.pokemons[index]
                            Button {
                                presentedPokemon.append(selectedPokemon.id)
                            } label: {
                                PokemonView(pokemon: selectedPokemon)
                                    .background(.blue)
                                    .cornerRadius(15)
                                    .padding(8)
                            }.buttonStyle(.plain)
                        }
                    }

                    if viewModel.activeRequest == nil {
                        Button(action: viewModel.loadMorePokemons) {
                            Text("Load next page")
                        }
                    } else {
                        Text("Loading...")
                    }
                }
            }.navigationDestination(for: Int.self) { id in
                PokemonDetailView(pokemonID: id)
            }
            .navigationTitle("Pokèdex")
            .task {
                viewModel.fetchPokemons()
            }
        }
    }
}

#Preview {
    PokemonListView()
}
