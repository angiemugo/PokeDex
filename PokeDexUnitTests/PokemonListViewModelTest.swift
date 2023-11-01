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
    var viewModel: PokemonListViewModel?
    var client: ApolloClientProtocol?

    override func setUpWithError() throws {
        viewModel = PokemonListViewModel()
        let store = MockApolloStore()
        client = MockApolloClient(store: store.store)
    }

    override func tearDownWithError() throws {
      viewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetDetails() {
        GetPokemonDetailsQuery.Data.Pokemon_v2_pokemon.from(<#T##mock: Mock<MockObject>##Mock<MockObject>#>)
    }

    func testFetchPokemons() {
//        viewModel.activeRequest = MockApolloClient().
//        fetch(
//            query: GetPokemonListQuery(offset: 0),
//            cachePolicy: .fetchIgnoringCacheData,
//            contextIdentifier: nil,
//            callbackQueue: nil
//        ) { result in
//            // Your assertion code here to verify the behavior
//            switch result {
//            case .success:
//                // Ensure that the viewModel properties are updated as expected
//                XCTAssertEqual(viewModel.pageOffset, 20)
//                XCTAssertFalse(viewModel.pokemons.isEmpty)
//            case .failure:
//                XCTFail("API request failed.")
//            }
//        }
    }

    func testFilterPokemons() {
//        let mockPokemons = Mock<Pokemon_v2_pokemon>()

    }


}
