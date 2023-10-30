//
//  PokemonView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

struct PokemonView: View {
    // this view needs - pokemon name, pokemon type, image

    var body: some View {
        VStack {
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("#001")
            }
            Spacer()
            HStack {
                VStack {
                    Text("grass")
                    Text("Poison")
                }
                Spacer()
                Image(systemName: "person")
            }
        }.padding()
    }
}

#Preview {
    PokemonView()
}
