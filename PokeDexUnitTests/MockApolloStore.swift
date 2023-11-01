//
//  MockApolloStore.swift
//  PokeDexUnitTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import Apollo
import ApolloTestSupport
import PokedexAPI
import PokeDexTests

class MockApolloStore {
    let store: ApolloStore

    init() {
        self.store = ApolloStore()
    }

    func loadPokemons() -> Mock<Pokemon_v2_pokemon> {
        let mockPokemons = Mock<Pokemon_v2_pokemon>()
        mockPokemons.id = 1
        mockPokemons.name = "Picachu"
        mockPokemons.pokemon_species_id = 10
        return mockPokemons
    }

    func loadPokemonDetail() -> Mock<Pokemon_v2_pokemon> {
        return Mock<Pokemon_v2_pokemon>(id: 1,
              name: "Bulbasar",
              pokemon_species_id: 1,
              pokemon_v2_pokemonabilities: [Mock(pokemon_v2_ability: Mock(name: "overgrow"))],
              pokemon_v2_pokemonmoves: [Mock(pokemon_v2_move: Mock(name: "tackle"))])
    }
}
