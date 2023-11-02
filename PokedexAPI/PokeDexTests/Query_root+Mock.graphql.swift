// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Query_root: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Query_root
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query_root>>

  public struct MockFields {
    @Field<[Pokemon_v2_pokemon]>("pokemon") public var pokemon
    @Field<[Pokemon_v2_pokemon]>("pokemon_v2_pokemon") public var pokemon_v2_pokemon
    @Field<[Pokemon_v2_pokemon]>("species") public var species
  }
}

public extension Mock where O == Query_root {
  convenience init(
    pokemon: [Mock<Pokemon_v2_pokemon>]? = nil,
    pokemon_v2_pokemon: [Mock<Pokemon_v2_pokemon>]? = nil,
    species: [Mock<Pokemon_v2_pokemon>]? = nil
  ) {
    self.init()
    _setList(pokemon, for: \.pokemon)
    _setList(pokemon_v2_pokemon, for: \.pokemon_v2_pokemon)
    _setList(species, for: \.species)
  }
}
