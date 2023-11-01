// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPokemonSpeciesQuery: GraphQLQuery {
  public static let operationName: String = "GetPokemonSpecies"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPokemonSpecies($id: Int!) { pokemon_v2_pokemonspecies(where: {id: {_eq: $id}}) { __typename id pokemon_v2_pokemoncolor { __typename name id } } }"#
    ))

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: PokedexAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokemonspecies", [Pokemon_v2_pokemonspecy].self, arguments: ["where": ["id": ["_eq": .variable("id")]]]),
    ] }

    /// An array relationship
    public var pokemon_v2_pokemonspecies: [Pokemon_v2_pokemonspecy] { __data["pokemon_v2_pokemonspecies"] }

    /// Pokemon_v2_pokemonspecy
    ///
    /// Parent Type: `Pokemon_v2_pokemonspecies`
    public struct Pokemon_v2_pokemonspecy: PokedexAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemonspecies }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("pokemon_v2_pokemoncolor", Pokemon_v2_pokemoncolor?.self),
      ] }

      public var id: Int { __data["id"] }
      /// An object relationship
      public var pokemon_v2_pokemoncolor: Pokemon_v2_pokemoncolor? { __data["pokemon_v2_pokemoncolor"] }

      /// Pokemon_v2_pokemonspecy.Pokemon_v2_pokemoncolor
      ///
      /// Parent Type: `Pokemon_v2_pokemoncolor`
      public struct Pokemon_v2_pokemoncolor: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemoncolor }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("id", Int.self),
        ] }

        public var name: String { __data["name"] }
        public var id: Int { __data["id"] }
      }
    }
  }
}
