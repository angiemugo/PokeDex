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
    let imageURL: URL
    let color: Color
    
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
                        Text(pokemonType.pokemon_v2_type?.name.capitalized ?? "")
                            .roundEdges(backgroundColor: color, lineColor: .clear)
                    }
                }
                Spacer()
                WebImage(url: imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
        }.padding()
            .brightness(-0.1)
    }
}

//#Preview {
//    PokemonView()
//}


