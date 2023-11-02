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
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Text("Use the advanced search to find the Pokèmon by type, weakness, ability and more!")
                        .padding([.horizontal])
                    SearchView(searchText: $searchText)
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<viewModel.pokemons.count, id: \.self) { index in
                                let selectedPokemon = viewModel.pokemons[index]
                                let pokemonStringColor = viewModel.groupedColors[selectedPokemon.id]?.first
                                let pokemonColor = pokemonStringColor?.pokemon_v2_pokemonspecy?.pokemon_v2_pokemoncolor?.name.color()
                                Button {
                                    presentedPokemon.append(selectedPokemon.id)
                                } label: {
                                    PokemonView(pokemon: selectedPokemon, imageURL: getImageURL(selectedPokemon.id), color: pokemonColor ?? .clear)
                                        .background(pokemonColor)
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
                    Button {
                        presentedPokemon.append(viewModel.pokemons.randomElement()!.id)
                    } label: {
                        Image(systemName: "wand.and.stars")
                        Text("Random")
                    }.tint(.primary)
                }.frame(height: 40)
                    .roundEdges(backgroundColor: Color.yellow, lineColor: .clear)
                    .padding(.horizontal, 10)
            }.navigationDestination(for: Int.self) { id in
                PokemonDetailView(pokemonID: id, imageURL: getImageURL(id))
            }.navigationTitle("Pokèdex")
                .task {
                    viewModel.loadMorePokemons()
                }.appAlert($viewModel.appAlert)
                .onChange(of: searchText) { newValue in
                    viewModel.filter(with: newValue)
                }
        }
    }
    
    
    func getImageURL(_ id: Int) -> URL {
        let pokemonIndex = id
        let baseURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        let imageURL = "\(baseURL)\(pokemonIndex).png"
        
        return URL(string: imageURL)!
    }
}

#Preview {
    PokemonListView()
}
