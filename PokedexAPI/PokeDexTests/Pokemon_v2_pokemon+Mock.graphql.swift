// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemon: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemon
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemon>>

  public struct MockFields {
    @Field<Int>("id") public var id
    @Field<String>("name") public var name
    @Field<Int>("pokemon_species_id") public var pokemon_species_id
    @Field<[Pokemon_v2_pokemonability]>("pokemon_v2_pokemonabilities") public var pokemon_v2_pokemonabilities
    @Field<[Pokemon_v2_pokemonmove]>("pokemon_v2_pokemonmoves") public var pokemon_v2_pokemonmoves
    @Field<Pokemon_v2_pokemonspecies>("pokemon_v2_pokemonspecy") public var pokemon_v2_pokemonspecy
    @Field<[Pokemon_v2_pokemonsprites]>("pokemon_v2_pokemonsprites") public var pokemon_v2_pokemonsprites
    @Field<[Pokemon_v2_pokemontype]>("pokemon_v2_pokemontypes") public var pokemon_v2_pokemontypes
  }
}

public extension Mock where O == Pokemon_v2_pokemon {
  convenience init(
    id: Int? = nil,
    name: String? = nil,
    pokemon_species_id: Int? = nil,
    pokemon_v2_pokemonabilities: [Mock<Pokemon_v2_pokemonability>]? = nil,
    pokemon_v2_pokemonmoves: [Mock<Pokemon_v2_pokemonmove>]? = nil,
    pokemon_v2_pokemonspecy: Mock<Pokemon_v2_pokemonspecies>? = nil,
    pokemon_v2_pokemonsprites: [Mock<Pokemon_v2_pokemonsprites>]? = nil,
    pokemon_v2_pokemontypes: [Mock<Pokemon_v2_pokemontype>]? = nil
  ) {
    self.init()
    _setScalar(id, for: \.id)
    _setScalar(name, for: \.name)
    _setScalar(pokemon_species_id, for: \.pokemon_species_id)
    _setList(pokemon_v2_pokemonabilities, for: \.pokemon_v2_pokemonabilities)
    _setList(pokemon_v2_pokemonmoves, for: \.pokemon_v2_pokemonmoves)
    _setEntity(pokemon_v2_pokemonspecy, for: \.pokemon_v2_pokemonspecy)
    _setList(pokemon_v2_pokemonsprites, for: \.pokemon_v2_pokemonsprites)
    _setList(pokemon_v2_pokemontypes, for: \.pokemon_v2_pokemontypes)
  }
}
