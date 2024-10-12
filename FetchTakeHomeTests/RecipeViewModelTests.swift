//
//  RecipeViewModelTests.swift
//  FetchTakeHomeTests
//
//  Created by Joseph Iglecias on 10/12/24.
//

import XCTest
@testable import FetchTakeHome

class RecipeViewModelTests: XCTestCase {
    @MainActor // Mark the class or function as main actor
    func testFetchRecipes() async {
        // Use the mock service for testing
        let mockService = MockRecipeService()
        let viewModel = RecipeViewModel(service: mockService) // No await needed here
        
        // Load recipes
        await viewModel.loadRecipes()
        
        // Assert that the state is loaded and the recipes are populated correctly
        switch viewModel.state {
        case .loaded(let recipes):
            XCTAssertEqual(recipes.count, 1) // Expecting 1 recipe from the mock service
            XCTAssertEqual(recipes.first?.name, "Spaghetti") // Check the name of the first recipe
        case .error(let message):
            XCTFail("Expected loaded state but received error: \(message)")
        case .loading, .idle:
            XCTFail("Expected loaded state but received idle/loading.")
        }
    }
}
