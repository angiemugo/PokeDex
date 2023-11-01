//
//  PokemonDetailViewModelTests.swift
//  PokeDexTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import XCTest
import ApolloTestSupport
import Apollo
@testable import PokeDex

class PokemonDetailViewModelTests: XCTestCase {

    // Mocked ApolloClient
    class MockApolloClient: ApolloClientProtocol {
        func fetch<Query: GraphQLQuery>(
            query: Query,
            cachePolicy: CachePolicy,
            contextIdentifier: UUID?,
            callbackQueue: DispatchQueue?,
            resultHandler: @escaping OperationResultHandler<Query>
        ) -> Apollo.Cancellable {
            // Simulate a successful API response for testing
            let mockResult: Result<GraphQLResult<Query.Data>, Error> = .success(GraphQLResult(data: Query.Data()))
            resultHandler(mockResult)
            return MockCancellable()
        }
    }

    class MockCancellable: Cancellable {
        func cancel() {
            // Do nothing for testing purposes
        }
    }

    func testLoadPokemonDetails_Success() {
        let viewModel = PokemonDetailViewModel(pokemonId: 1)
        viewModel.activeRequest = nil // Clear any existing requests

        // Inject the mocked Apollo client
        viewModel.activeRequest = MockApolloClient().fetch(
            query: GetPokemonDetailsQuery(id: 1),
            cachePolicy: .fetchIgnoringCacheData,
            contextIdentifier: nil,
            callbackQueue: nil
        ) { result in
            // Your assertion code here to verify the behavior
            switch result {
            case .success:
                XCTAssertNotNil(viewModel.pokemonDetail)
            case .failure:
                XCTFail("API request failed.")
            }
        }
    }

    func testLoadPokemonDetails_Failure() {
        let viewModel = PokemonDetailViewModel(pokemonId: 1)
        viewModel.activeRequest = nil // Clear any existing requests

        // Inject the mocked Apollo client to simulate a failure
        viewModel.activeRequest = MockApolloClient().fetch(
            query: GetPokemonDetailsQuery(id: 1),
            cachePolicy: .fetchIgnoringCacheData,
            contextIdentifier: nil,
            callbackQueue: nil
        ) { result in
            // Your assertion code here to verify the behavior
            switch result {
            case .success:
                XCTFail("API request should have failed.")
            case .failure:
                XCTAssertNotNil(viewModel.appAlert)
            }
        }
    }
}
