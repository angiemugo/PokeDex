//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel
    let imageURL: URL

    init(pokemonID: Int, imageURL: URL) {
        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(pokemonId: pokemonID))
        self.imageURL = imageURL
    }

    var body: some View {
        Group {
            if let _ = viewModel.activeRequest {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                VStack {
                    if let pokemon = viewModel.pokemonDetail {
                        HStack {
                            WebImage(url: imageURL)
                            Text(pokemon.name.capitalized)
                        }.frame(height: 30)
                        List {
                            Section(header: Text("Type")) {
                                ForEach(pokemon.pokemon_v2_pokemontypes, id: \.self) { type in
                                    Text(type.pokemon_v2_type?.name ?? "Type")
                                }
                            }

                            Section(header: Text("Abilities")) {
                                ForEach(pokemon.pokemon_v2_pokemonabilities, id: \.self) { ability in
                                    Text(ability.pokemon_v2_ability?.name ?? "Ability")
                                }
                            }

                            Section(header: Text("Moves")) {
                                ForEach(pokemon.pokemon_v2_pokemonmoves, id: \.self) { move in
                                    Text(move.pokemon_v2_move?.name ?? "Move")
                                }
                            }
                        }
                    }
                }
            }
        }.task {
            viewModel.loadPokemonDetails()
        }.appAlert($viewModel.appAlert)
    }

}

#Preview {
    PokemonDetailView(pokemonID: 10, imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1")!)
}
