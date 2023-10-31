// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PokedexAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PokedexAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PokedexAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PokedexAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "query_root": return PokedexAPI.Objects.Query_root
    case "pokemon_v2_pokemon": return PokedexAPI.Objects.Pokemon_v2_pokemon
    case "pokemon_v2_pokemontype": return PokedexAPI.Objects.Pokemon_v2_pokemontype
    case "pokemon_v2_type": return PokedexAPI.Objects.Pokemon_v2_type
    case "pokemon_v2_pokemonability": return PokedexAPI.Objects.Pokemon_v2_pokemonability
    case "pokemon_v2_ability": return PokedexAPI.Objects.Pokemon_v2_ability
    case "pokemon_v2_pokemonmove": return PokedexAPI.Objects.Pokemon_v2_pokemonmove
    case "pokemon_v2_move": return PokedexAPI.Objects.Pokemon_v2_move
    case "pokemon_v2_pokemonsprites": return PokedexAPI.Objects.Pokemon_v2_pokemonsprites
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
