//
//  Network.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Foundation
import Apollo
import ApolloSQLite
import ApolloAPI

class Network {
  static let shared = Network()

    var client: ApolloClient = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                .userDomainMask,
                                                                true).first!
        let documentsURL = URL(filePath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("test_apollo_db.sqlite")
        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        let store = ApolloStore(cache: sqliteCache)
        let client = URLSessionClient()
        let provider = DefaultInterceptorProvider(store: store)
        let url = URL(string: "https://beta.pokeapi.co/graphql/v1beta")!
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
}

