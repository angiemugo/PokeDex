// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_pokemoncolor: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_pokemoncolor
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_pokemoncolor>>

  public struct MockFields {
    @Field<Int>("id") public var id
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Pokemon_v2_pokemoncolor {
  convenience init(
    id: Int? = nil,
    name: String? = nil
  ) {
    self.init()
    _setScalar(id, for: \.id)
    _setScalar(name, for: \.name)
  }
}
