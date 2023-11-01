// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_move: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_move
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_move>>

  public struct MockFields {
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Pokemon_v2_move {
  convenience init(
    name: String? = nil
  ) {
    self.init()
    _setScalar(name, for: \.name)
  }
}
