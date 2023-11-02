// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemontype: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemontype
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemontype>>

  public struct MockFields {
    @Field<Pokemon_v2_type>("pokemon_v2_type") public var pokemon_v2_type
  }
}

public extension Mock where O == Pokemon_v2_pokemontype {
  convenience init(
    pokemon_v2_type: Mock<Pokemon_v2_type>? = nil
  ) {
    self.init()
    _setEntity(pokemon_v2_type, for: \.pokemon_v2_type)
  }
}
