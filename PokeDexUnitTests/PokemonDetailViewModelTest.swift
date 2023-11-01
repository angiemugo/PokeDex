//
//  PokemonDetailViewModelTest.swift
//  PokeDexUnitTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import XCTest
import Apollo
import ApolloTestSupport
import PokedexAPI
@testable import PokeDex

final class PokemonDetailViewModelTest: XCTestCase {
    var viewModel: PokemonDetailViewModel!
    var client: ApolloClientProtocol!
    var store: MockApolloStore!

    override func setUpWithError() throws {
        viewModel = PokemonDetailViewModel(pokemonId: 1)
        self.store = MockApolloStore()
        client = MockApolloClient(store: self.store.store)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        client = nil
    }

    func testGetDetails() {
        let mockData = store.loadPokemonDetail()
        let mockQuery = GetPokemonDetailsQuery.Data(_fieldData: mockData)

        let mockClient = MockApolloClient(store: store.store)
        let expectation = XCTestExpectation(description: "Load Pokemon Details")

        viewModel.activeRequest = mockClient.fetch(query: GetPokemonDetailsQuery(id: 1), cachePolicy: .default, contextIdentifier: nil, context: nil, queue: .main) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.data, mockQuery)
            case .failure:
                XCTFail("Request should succeed")
            }

            expectation.fulfill()
        }

        viewModel.loadPokemonDetails()
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(viewModel.pokemonDetail)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
