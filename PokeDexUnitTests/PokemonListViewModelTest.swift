//
//  PokemonListViewModelTest.swift
//  PokeDexUnitTests
//
//  Created by Angie Mugo on 01/11/2023.
//

import XCTest
import Apollo
import ApolloTestSupport
import PokedexAPI
@testable import PokeDex

final class PokemonListViewModelTest: XCTestCase {
    var viewModel: PokemonListViewModel!
    var mockResponse: MockApolloClientResponse!


    override func setUpWithError() throws {
        viewModel = PokemonListViewModel()
        mockResponse = MockApolloClientResponse()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockResponse = nil
    }

    func testGetPokemons() {
        let mockData = MockApolloClientResponse()
        viewModel.fetchPokemons(from: mockResponse.getLoadPokemonsList())
        XCTAssertNil(viewModel.appAlert)
    }

    func testFilter() {
        let filterText = "abc"
        viewModel.activeRequest = mockResponse.getLoadPokemonsList() as? any Cancellable
        viewModel.filter(with: filterText)
        XCTAssertNotEqual(viewModel.pokemons, viewModel.unfilteredPokemons)
    }
}
