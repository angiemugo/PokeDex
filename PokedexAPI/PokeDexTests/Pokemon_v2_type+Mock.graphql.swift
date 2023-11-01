// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PokedexAPI

public class Pokemon_v2_type: MockObject {
  public static let objectType: Object = PokedexAPI.Objects.Pokemon_v2_type
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Pokemon_v2_type>>

  public struct MockFields {
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Pokemon_v2_type {
  convenience init(
    name: String? = nil
  ) {
    self.init()
    _setScalar(name, for: \.name)
  }
}
