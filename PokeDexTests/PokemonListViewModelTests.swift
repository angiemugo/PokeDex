//
//  PokemonListViewModelTests.swift
//  PokeDexTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import XCTest
import Apollo
@testable import PokeDex

class PokemonListViewModelTests: XCTestCase {

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

    func testFetchPokemons() {
        let viewModel = PokemonListViewModel()
        viewModel.pageOffset = 0 // Set an offset for the test
        viewModel.activeRequest = nil // Clear any existing requests

        // Inject the mocked Apollo client
        viewModel.activeRequest = MockApolloClient().fetch(
            query: GetPokemonListQuery(offset: 0),
            cachePolicy: .fetchIgnoringCacheData,
            contextIdentifier: nil,
            callbackQueue: nil
        ) { result in
            // Your assertion code here to verify the behavior
            switch result {
            case .success:
                // Ensure that the viewModel properties are updated as expected
                XCTAssertEqual(viewModel.pageOffset, 20)
                XCTAssertFalse(viewModel.pokemons.isEmpty)
            case .failure:
                XCTFail("API request failed.")
            }
        }
    }

    func testFilterPokemons() {
        let viewModel = PokemonListViewModel()
        viewModel.unfilteredPokemons = [
            PokemonsAndSpecies.Pokemon(id: "1", name: "Bulbasaur"),
            PokemonsAndSpecies.Pokemon(id: "2", name: "Charmander"),
            PokemonsAndSpecies.Pokemon(id: "3", name: "Squirtle"),
        ]

        // Test filtering
        viewModel.filter(with: "char")
        XCTAssertEqual(viewModel.pokemons.count, 2)

        viewModel.filter(with: "xyz")
        XCTAssertTrue(viewModel.pokemons.isEmpty)

        viewModel.filter(with: "")
        XCTAssertEqual(viewModel.pokemons.count, viewModel.unfilteredPokemons.count)
    }

    func testGroupColors() {
        let viewModel = PokemonListViewModel()
        let species = [
            PokemonsAndSpecies.Specy(id: 1, name: "Species1"),
            PokemonsAndSpecies.Specy(id: 2, name: "Species2"),
            PokemonsAndSpecies.Specy(id: 1, name: "Species3"),
        ]

        viewModel.getColorsGrouped(for: species)
        XCTAssertEqual(viewModel.groupedColors.count, 2)
    }
}

