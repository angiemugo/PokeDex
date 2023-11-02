// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemonspecies: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemonspecies
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemonspecies>>

  public struct MockFields {
    @Field<Int>("id") public var id
    @Field<Pokemon_v2_pokemoncolor>("pokemon_v2_pokemoncolor") public var pokemon_v2_pokemoncolor
  }
}

public extension Mock where O == Pokemon_v2_pokemonspecies {
  convenience init(
    id: Int? = nil,
    pokemon_v2_pokemoncolor: Mock<Pokemon_v2_pokemoncolor>? = nil
  ) {
    self.init()
    _setScalar(id, for: \.id)
    _setEntity(pokemon_v2_pokemoncolor, for: \.pokemon_v2_pokemoncolor)
  }
}
