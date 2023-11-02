// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public final class GetPokemonListQuery: GraphQLQuery {
  public static let operationName: String = "GetPokemonList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    operationIdentifier: "c2af2f1d0425fd37acecabd5038ab9cd4e504a681259e6e1ee45276d1c696abf",
    definition: .init(
      #"query GetPokemonList($offset: Int!, $limit: Int = 20) { ...PokemonsAndSpecies }"#,
      fragments: [PokemonsAndSpecies.self]
    ))

  public var offset: Int
  public var limit: GraphQLNullable<Int>

  public init(
    offset: Int,
    limit: GraphQLNullable<Int> = 20
  ) {
    self.offset = offset
    self.limit = limit
  }

  public var __variables: Variables? { [
    "offset": offset,
    "limit": limit
  ] }

  public struct Data: PokedexAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .fragment(PokemonsAndSpecies.self),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon: [PokemonsAndSpecies.Pokemon] { __data["pokemon"] }
    /// fetch data from the table: "pokemon_v2_pokemon"
    public var species: [PokemonsAndSpecies.Specy] { __data["species"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var pokemonsAndSpecies: PokemonsAndSpecies { _toFragment() }
    }
  }
}
