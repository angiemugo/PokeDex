//
//  MockApolloClient.swift
//  PokeDexUnitTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import Foundation
@testable import Apollo
@testable import ApolloAPI

class MockApolloClient : ApolloClientProtocol {
    var store: Apollo.ApolloStore

    init(store: Apollo.ApolloStore) {
      self.store = store
    }

    func clearCache(callbackQueue: DispatchQueue, completion: ((Result<Void, Error>) -> Void)?) {
      if let completion {
        completion(.success(()))
      }
    }
    
    func fetch<Query>(query: Query, cachePolicy: Apollo.CachePolicy, contextIdentifier: UUID?, context: Apollo.RequestContext?, queue: DispatchQueue, resultHandler: Apollo.GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable where Query : ApolloAPI.GraphQLQuery {

        defer {
               if let resultHandler = resultHandler {
                   let mockResult = GraphQLResult(
                    data: try! Query.Data(data: ["key": "data"]),
                       extensions: nil,
                       errors: nil,
                       source: .server,
                       dependentKeys: nil
                   )
                   resultHandler(.success(mockResult))
               }
           }

           return EmptyCancellable()
    }

    func watch<Query>(query: Query, cachePolicy: Apollo.CachePolicy, context: Apollo.RequestContext?, callbackQueue: DispatchQueue, resultHandler: @escaping Apollo.GraphQLResultHandler<Query.Data>) -> Apollo.GraphQLQueryWatcher<Query> where Query : ApolloAPI.GraphQLQuery {
        defer {
          resultHandler(.success(GraphQLResult(
            data: try! Query.Data(data: [:]),
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil
          )))
        }

        return GraphQLQueryWatcher(
          client: self,
          query: query,
          callbackQueue: callbackQueue,
          resultHandler: resultHandler
        )
    }
    
    func perform<Mutation>(mutation: Mutation, publishResultToStore: Bool, context: Apollo.RequestContext?, queue: DispatchQueue, resultHandler: Apollo.GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable where Mutation : ApolloAPI.GraphQLMutation {
        defer {
          if let resultHandler {
            resultHandler(.success(GraphQLResult(
              data: try! Mutation.Data(data: ["key": "performResult"]),
              extensions: nil,
              errors: nil,
              source: .server,
              dependentKeys: nil
            )))
          }
        }

        return EmptyCancellable()
    }
    
    func upload<Operation>(operation: Operation, files: [Apollo.GraphQLFile], context: Apollo.RequestContext?, queue: DispatchQueue, resultHandler: Apollo.GraphQLResultHandler<Operation.Data>?) -> Apollo.Cancellable where Operation : ApolloAPI.GraphQLOperation {
        defer {
          if let resultHandler {
            resultHandler(.success(GraphQLResult(
              data: try! Operation.Data(data: ["key": "uploadResult"]),
              extensions: nil,
              errors: nil,
              source: .server,
              dependentKeys: nil
            )))
          }
        }

        return EmptyCancellable()
    }
    
    func subscribe<Subscription>(subscription: Subscription, context: Apollo.RequestContext?, queue: DispatchQueue, resultHandler: @escaping Apollo.GraphQLResultHandler<Subscription.Data>) -> Apollo.Cancellable where Subscription : ApolloAPI.GraphQLSubscription {
        defer {
          resultHandler(.success(GraphQLResult(
            data: try! Subscription.Data(data: ["key": "subscribeResult"]),
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil
          )))
        }

        return EmptyCancellable()
    }
}
