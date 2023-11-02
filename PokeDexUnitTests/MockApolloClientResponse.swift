//
//  MockApolloClientResponse.swift
//  PokeDexUnitTests
//
//  Created by Angie Mugo on 02/11/2023.
//

import Foundation
import PokedexAPI
import PokeDexTests
import ApolloTestSupport
import Combine
import Apollo

enum ApolloClientError: Error {
    case networkError(String)
    case queryError(String)
    case dataParsingError
}

class MockApolloClientResponse {

    func loadPokemons() -> Mock<Query_root> {
        let mockPokemons = Mock<Pokemon_v2_pokemon>()
        mockPokemons.id = 1
        mockPokemons.name = "Picachu"
        mockPokemons.pokemon_species_id = 10
        return Mock(pokemon: [mockPokemons])
    }

    func loadPokemonDetail() -> Mock<Pokemon_v2_pokemon> {
        return Mock<Pokemon_v2_pokemon>(id: 1,
                                        name: "Bulbasar",
                                        pokemon_species_id: 1,
                                        pokemon_v2_pokemonabilities: [Mock(pokemon_v2_ability: Mock(name: "overgrow"))],
                                        pokemon_v2_pokemonmoves: [Mock(pokemon_v2_move: Mock(name: "tackle"))])
    }

    func getLoadPokemonsSuccess() -> AnyPublisher<GetPokemonListQuery.Data, Error> {
        let queryModel = GetPokemonListQuery.Data.from(loadPokemons())

        return Just(queryModel)
            .tryMap { pokemons in
                guard !pokemons.pokemon.isEmpty else {
                    throw ApolloClientError.dataParsingError
                }
                return pokemons
            }
            .eraseToAnyPublisher()
    }

    func getLoadPokemonsList() -> GetPokemonListQuery.Data {
        let mockData = loadPokemons()
        return GetPokemonListQuery.Data.from(mockData)
    }


    func getLoadPokemonDetail(_id: Int) -> AnyCancellable {
        let mockData = loadPokemonDetail()

        return Future<GetPokemonListQuery.Data, Error> { promise in
            let queryData = GetPokemonListQuery.Data(_fieldData: mockData)
            promise(.success(queryData))
        }
        .sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }
}
