// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemonability: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemonability
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemonability>>

  public struct MockFields {
    @Field<Pokemon_v2_ability>("pokemon_v2_ability") public var pokemon_v2_ability
  }
}

public extension Mock where O == Pokemon_v2_pokemonability {
  convenience init(
    pokemon_v2_ability: Mock<Pokemon_v2_ability>? = nil
  ) {
    self.init()
    _setEntity(pokemon_v2_ability, for: \.pokemon_v2_ability)
  }
}
