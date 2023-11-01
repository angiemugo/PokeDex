// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemonmove: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemonmove
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemonmove>>

  public struct MockFields {
    @Field<Pokemon_v2_move>("pokemon_v2_move") public var pokemon_v2_move
  }
}

public extension Mock where O == Pokemon_v2_pokemonmove {
  convenience init(
    pokemon_v2_move: Mock<Pokemon_v2_move>? = nil
  ) {
    self.init()
    _setEntity(pokemon_v2_move, for: \.pokemon_v2_move)
  }
}
