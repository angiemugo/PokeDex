//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel

    init(pokemonID: Int) {
        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(pokemonId: pokemonID))

    }
    var body: some View {
        VStack {
            if let pokemon = viewModel.pokemonDetail {
                HStack {
                    Image(systemName: "person")
                    Text(pokemon.name)
                }
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
        }.task {
            viewModel.loadPokemonDetails()
        }
    }
}

#Preview {
    PokemonDetailView(pokemonID: 10)
}
