//
//  PokemonView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI
import PokedexAPI
import SDWebImageSwiftUI

struct PokemonView: View {
    let pokemon: GetPokemonsQuery.Data.Pokemon_v2_pokemon

    var body: some View {
        VStack {
            HStack {
                Text(pokemon.name)
                Spacer()
                Text("#\(pokemon.id)")
            }
            Spacer()
            HStack {
                VStack {
                    ForEach(pokemon.pokemon_v2_pokemontypes, id: \.self) { pokemonType in
                        Text(pokemonType.pokemon_v2_type?.name ?? "")
                    }
                }
                Spacer()
                WebImage(url: getImageURL())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
        }.padding()
    }

    func getImageURL() -> URL? {
        let jsonString = pokemon.pokemon_v2_pokemonsprites.first?.sprites ?? ""

        if let data = jsonString.data(using: .utf8) {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let frontDefault = jsonObject["front_default"] as? String {
                    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master\(frontDefault)"
                    return URL(string: url)

                } else {
                    print("Front Default URL not found or invalid format")
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        return nil
    }
}

//#Preview {
//    PokemonView()
//}


