// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPokemonDetailsQuery: GraphQLQuery {
  public static let operationName: String = "GetPokemonDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPokemonDetails($id: Int!) { pokemon_v2_pokemon(where: {id: {_eq: $id}}) { __typename id pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } pokemon_v2_pokemonabilities { __typename pokemon_v2_ability { __typename name } } pokemon_v2_pokemonmoves { __typename pokemon_v2_move { __typename name } } name pokemon_v2_pokemonsprites { __typename sprites } } }"#
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
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: ["where": ["id": ["_eq": .variable("id")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon_v2_pokemon: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemon"] }

    /// Pokemon_v2_pokemon
    ///
    /// Parent Type: `Pokemon_v2_pokemon`
    public struct Pokemon_v2_pokemon: PokedexAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
        .field("pokemon_v2_pokemonabilities", [Pokemon_v2_pokemonability].self),
        .field("pokemon_v2_pokemonmoves", [Pokemon_v2_pokemonmofe].self),
        .field("name", String.self),
        .field("pokemon_v2_pokemonsprites", [Pokemon_v2_pokemonsprite].self),
      ] }

      public var id: Int { __data["id"] }
      /// An array relationship
      public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
      /// An array relationship
      public var pokemon_v2_pokemonabilities: [Pokemon_v2_pokemonability] { __data["pokemon_v2_pokemonabilities"] }
      /// An array relationship
      public var pokemon_v2_pokemonmoves: [Pokemon_v2_pokemonmofe] { __data["pokemon_v2_pokemonmoves"] }
      public var name: String { __data["name"] }
      /// An array relationship
      public var pokemon_v2_pokemonsprites: [Pokemon_v2_pokemonsprite] { __data["pokemon_v2_pokemonsprites"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype
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

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
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

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability
      ///
      /// Parent Type: `Pokemon_v2_pokemonability`
      public struct Pokemon_v2_pokemonability: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemonability }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_ability", Pokemon_v2_ability?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_ability: Pokemon_v2_ability? { __data["pokemon_v2_ability"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability
        ///
        /// Parent Type: `Pokemon_v2_ability`
        public struct Pokemon_v2_ability: PokedexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_ability }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonmofe
      ///
      /// Parent Type: `Pokemon_v2_pokemonmove`
      public struct Pokemon_v2_pokemonmofe: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemonmove }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_move", Pokemon_v2_move?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_move: Pokemon_v2_move? { __data["pokemon_v2_move"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonmofe.Pokemon_v2_move
        ///
        /// Parent Type: `Pokemon_v2_move`
        public struct Pokemon_v2_move: PokedexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_move }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonsprite
      ///
      /// Parent Type: `Pokemon_v2_pokemonsprites`
      public struct Pokemon_v2_pokemonsprite: PokedexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokedexAPI.Objects.Pokemon_v2_pokemonsprites }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("sprites", String.self),
        ] }

        public var sprites: String { __data["sprites"] }
      }
    }
  }
}
