// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct PokemonsAndSpecies: PokedexAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment PokemonsAndSpecies on query_root { __typename pokemon: pokemon_v2_pokemon(offset: $offset, limit: $limit) { __typename id pokemon_species_id pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } name } species: pokemon_v2_pokemon(offset: $offset, limit: $limit) { __typename id pokemon_v2_pokemonspecy { __typename id pokemon_v2_pokemoncolor { __typename id name } } } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Query_root }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("pokemon_v2_pokemon", alias: "pokemon", [Pokemon].self, arguments: [
      "offset": .variable("offset"),
      "limit": .variable("limit")
    ]),
    .field("pokemon_v2_pokemon", alias: "species", [Specy].self, arguments: [
      "offset": .variable("offset"),
      "limit": .variable("limit")
    ]),
  ] }

  /// fetch data from the table: "pokemon_v2_pokemon"
  public var pokemon: [Pokemon] { __data["pokemon"] }
  /// fetch data from the table: "pokemon_v2_pokemon"
  public var species: [Specy] { __data["species"] }

  /// Pokemon
  ///
  /// Parent Type: `Pokemon_v2_pokemon`
  public struct Pokemon: PokedexAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemon }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("pokemon_species_id", Int?.self),
      .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
      .field("name", String.self),
    ] }

    public var id: Int { __data["id"] }
    public var pokemon_species_id: Int? { __data["pokemon_species_id"] }
    /// An array relationship
    public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
    public var name: String { __data["name"] }

    /// Pokemon.Pokemon_v2_pokemontype
    ///
    /// Parent Type: `Pokemon_v2_pokemontype`
    public struct Pokemon_v2_pokemontype: PokedexAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemontype }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pokemon_v2_type", Pokemon_v2_type?.self),
      ] }

      /// An object relationship
      public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

      /// Pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
      ///
      /// Parent Type: `Pokemon_v2_type`
      public struct Pokemon_v2_type: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_type }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }
    }
  }

  /// Specy
  ///
  /// Parent Type: `Pokemon_v2_pokemon`
  public struct Specy: PokedexAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemon }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
    ] }

    public var id: Int { __data["id"] }
    /// An object relationship
    public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }

    /// Specy.Pokemon_v2_pokemonspecy
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

      /// Specy.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemoncolor
      ///
      /// Parent Type: `Pokemon_v2_pokemoncolor`
      public struct Pokemon_v2_pokemoncolor: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemoncolor }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String.self),
        ] }

        public var id: Int { __data["id"] }
        public var name: String { __data["name"] }
      }
    }
  }
}
