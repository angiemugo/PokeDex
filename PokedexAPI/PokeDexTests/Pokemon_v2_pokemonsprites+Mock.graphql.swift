// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemonsprites: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemonsprites
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemonsprites>>

  public struct MockFields {
    @Field<String>("sprites") public var sprites
  }
}

public extension Mock where O == Pokemon_v2_pokemonsprites {
  convenience init(
    sprites: String? = nil
  ) {
    self.init()
    _setScalar(sprites, for: \.sprites)
  }
}
