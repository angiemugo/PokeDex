//
//  PokemonsViewModel.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Apollo
import PokedexAPI
import SwiftUI

class PokemonsViewModel: ObservableObject{
    @Published var pokemons = [GetPokemonsQuery.Data.Pokemon_v2_pokemon]()
    @Published var errorMessage: String?
    @Published var activeRequest: Cancellable?
    @Published var pageOffset: Int?

    func loadMorePokemons() {
        guard let pageOffset = pageOffset else {
            self.fetchPokemons(from: 0)
            return
        }

        fetchPokemons(from: pageOffset)
    }

    func fetchPokemons(from page: Int = 0) {
        self.activeRequest = Network.shared.apollo.fetch(query: GetPokemonsQuery(offset: page)) { [weak self] result in
            guard let self = self else { return }
            self.activeRequest = nil
            switch result {
            case .success(let graphQLResult):
                if let pokemonData = graphQLResult.data {
                    pageOffset = 20 + page
                    self.pokemons.append(contentsOf: pokemonData.pokemon_v2_pokemon)
                }

                if let errors = graphQLResult.errors {
                    // handle this
                }
            case .failure(let error):
                print("we got an error")
                // handle this

            }
        }
    }

}

