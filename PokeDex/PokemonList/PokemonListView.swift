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
    @StateObject private var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack(path: $presentedPokemon) {
            ZStack {
                VStack {
                    Text("Use the advanced search to find the Pokèmon by type, weakness, ability and more!").padding([.horizontal])
                    SearchView(searchText: $searchText, filters: $filters)
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<viewModel.pokemons.count, id: \.self) { index in
                                let selectedPokemon = viewModel.pokemons[index]
                                let pokemonColor = viewModel.groupedColors[selectedPokemon.id]?.first
                                Button {
                                    presentedPokemon.append(selectedPokemon.id)
                                } label: {
                                    PokemonView(pokemon: selectedPokemon)
                                        .background(MyColor(rawValue: (pokemonColor?.pokemon_v2_pokemonspecy?.pokemon_v2_pokemoncolor!.name)!)?.color ?? .clear)
                                        .cornerRadius(15)
                                        .padding(.leading, 8)
                                        .padding(.trailing, 4)
                                }.buttonStyle(.plain)
                            }
                        }

                        if viewModel.activeRequest == nil {
                            Button(action: viewModel.loadMorePokemons) {
                                Text("Load next page")
                            }
                        } else {
                            HStack {
                                Text("Loading...")
                                ProgressView()
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    Button {
                        presentedPokemon.append(viewModel.pokemons.randomElement()!.id)
                    } label: {
                        Text("Random")
                    }
                }.frame(height: 30)
                .roundEdges(backgroundColor: Color.yellow, lineColor: .clear)
            }.navigationDestination(for: Int.self) { id in
                PokemonDetailView(pokemonID: id)
            }
            .navigationTitle("Pokèdex")
            .task {
                viewModel.fetchPokemons()
            }
            .appAlert($viewModel.appAlert)
            .onChange(of: searchText) { newValue in
                viewModel.filter(with: newValue)
            }
        }
    }
}

extension Color {

}

#Preview {
    PokemonListView()
}
