//
//  Network.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)
}
