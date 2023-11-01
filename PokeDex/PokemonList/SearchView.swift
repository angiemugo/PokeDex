//
//  SearchView.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @Binding var filters: Set<String>
    @FocusState private var fieldFocused: Bool

    var body: some View {
            ZStack(alignment: .leading) {
                Image(systemName: "magnifyingglass")
                TextField("Search a Pokèmon by name",
                          text: $searchText)
                .padding(.horizontal, 30)
                .textFieldStyle(.plain)
            }.frame(height: 30)
            .roundEdges()
            .padding(.horizontal, 10)
    }

    func filter() {
        print("doing filter")
    }
}

#Preview {
    SearchView(searchText: .constant("pokemon"), filters: .constant([""]))
}
