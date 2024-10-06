//
//  FetchTakeHomeTests.swift
//  FetchTakeHomeTests
//
//  Created by Joseph Iglecias on 10/5/24.
//

import XCTest
@testable import FetchTakeHome

final class RecipeServiceTests: XCTestCase {
    
    var apiService: APIService!

    override func setUpWithError() throws {
        apiService = APIService()
    }

    override func tearDownWithError() throws {
        apiService = nil
    }

    // Test case to ensure valid data is fetched and decoded successfully
    func testFetchAllRecipesSuccess() async throws {
        let validRecipesURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        
        do {
            let recipes = try await apiService.fetchRecipes(from: validRecipesURL)
            XCTAssertFalse(recipes.isEmpty, "Recipes should not be empty")
            XCTAssertNotNil(recipes.first?.name, "First recipe should have a name")
        } catch {
            XCTFail("Fetching valid recipes failed with error: \(error.localizedDescription)")
        }
    }

    // Test case to handle malformed data
    func testFetchMalformedRecipes() async throws {
        // Given: Malformed data URL
        let malformedURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        
        do {
            // When: Calling the API
            _ = try await apiService.fetchRecipes(from: malformedURL)
            XCTFail("Expected APIError.malformedRecipe but got no error")
        } catch let error as APIServiceError {
            // Then: Verify that the correct error is thrown
            XCTAssertEqual(error, APIServiceError.malformedData, "Malformed data should throw APIError.malformedRecipe")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }


    // Test case to handle empty data scenario
    func testEmptyData() async throws {
        // Given: Empty data URL
        let emptyURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        
        do {
            // When: Calling the API
            let recipes = try await apiService.fetchRecipes(from: emptyURL)
            
            // Then: Verify no error and that the recipe list is empty
            XCTAssertTrue(recipes.isEmpty, "Expected no recipes, but got some recipes")
        } catch {
            XCTFail("Expected no error, but got \(error)")
        }
    }

}

