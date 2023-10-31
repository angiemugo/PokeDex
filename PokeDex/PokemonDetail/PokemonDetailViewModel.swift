//
//  PokemonDetailViewModel.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Apollo
import PokedexAPI
import Combine

class PokemonDetailViewModel: ObservableObject {
    let pokemonId: Int
    @Published var pokemonDetail: GetPokemonDetailsQuery.Data.Pokemon_v2_pokemon?
    @Published var appAlert: AppAlert?

    init(pokemonId: Int) {
        self.pokemonId = pokemonId
    }

    func loadPokemonDetails() {
        Network.shared.apollo.fetch(query: GetPokemonDetailsQuery(id: pokemonId)) { [weak self] result in
                guard let self = self else {
                    return
                }

                switch result {
                case .success(let graphQLResult):
                    if let pokemonDetail = graphQLResult.data?.pokemon_v2_pokemon.first {
                        self.pokemonDetail = pokemonDetail
                        self.appAlert = .message(title: "Success", message: "Pokèmons details loaded")
                    }

                    if let errors = graphQLResult.errors {
                        self.appAlert = .errors(errors: errors)
                    }
                case .failure(let error):
                    self.appAlert = .errors(errors: [error])
                }
            }
        }

}
