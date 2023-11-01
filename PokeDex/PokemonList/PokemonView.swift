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
    let pokemon: PokemonsAndSpecies.Pokemon

    var body: some View {
        VStack {
            HStack {
                Text(pokemon.name.capitalized)
                Spacer()
                Text("#\(pokemon.id)")
            }
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    ForEach(pokemon.pokemon_v2_pokemontypes, id: \.self) { pokemonType in
                        Text(pokemonType.pokemon_v2_type?.name.capitalized ?? "").roundEdges(backgroundColor: Color.gray.opacity(0.5), lineColor: .clear)
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
        let pokemonIndex =   pokemon.id

        let baseURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        let imageURL = "\(baseURL)\(pokemonIndex).png"

        return URL(string: imageURL)
    }
}

//#Preview {
//    PokemonView()
//}


