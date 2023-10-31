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
        HStack {
            ZStack(alignment: .leading) {
                Image(systemName: "magnifyingglass")
                TextField("Search a Pokèmon",
                          text: $searchText)
                .padding(.horizontal, 30)
                .textFieldStyle(.plain)
            }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding()
                .roundEdges()

            Button("", systemImage: "line.3.horizontal.decrease.circle") {
                filter()
            }.frame(maxHeight: .infinity)
                .roundEdges(backgroundColor: Color.gray.opacity(0.5), lineColor: .clear)
        }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding()
    }

    func filter() {
        print("doing filter")
    }
}

#Preview {
    SearchView(searchText: .constant("pokemon"), filters: .constant([""]))
}
