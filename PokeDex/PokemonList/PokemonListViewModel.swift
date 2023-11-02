//
//  PokemonListViewModel.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Apollo
import PokedexAPI
import SwiftUI

class PokemonListViewModel: ObservableObject{
    @Published var pokemons = [PokemonsAndSpecies.Pokemon]()
    @Published var activeRequest: Cancellable?
    @Published var pageOffset: Int?
    @Published var appAlert: AppAlert?
    @Published var groupedColors =  [Int: [PokemonsAndSpecies.Specy]]()
    var unfilteredPokemons = [PokemonsAndSpecies.Pokemon]()

    func loadMorePokemons() {
        guard let pageOffset = pageOffset else {
            self.fetchPokemons(from: 0)
            return
        }
        fetchPokemons(from: pageOffset)
    }

    func fetchPokemons(from page: Int = 0) {
        self.activeRequest = Network.shared.client.fetch(query: GetPokemonListQuery(offset: page)) { [weak self] result in
            guard let self = self else { return }
            self.activeRequest = nil
            switch result {
            case .success(let graphQLResult):
                if let pokemonData = graphQLResult.data {
                    pageOffset = 20 + page
                    self.pokemons.append(contentsOf: pokemonData.pokemon)
                    getColorsGrouped(for: pokemonData.species)
                    unfilteredPokemons = self.pokemons
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }

    func filter(with text: String) {
        let filteredPokemons = text == "" ? unfilteredPokemons : unfilteredPokemons.filter { $0.name.lowercased().contains(text.lowercased()) }
        pokemons = filteredPokemons
    }

    func getColorsGrouped(for species: [PokemonsAndSpecies.Specy]) {
        let grouped = Dictionary(grouping: species, by: { $0.id})
        self.groupedColors = groupedColors.merging(grouped, uniquingKeysWith:{(first, _) in first })
    }
}
