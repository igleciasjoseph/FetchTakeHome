//
//  RecipeViewModel.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var state: RecipeState = .idle
    
    private let service: APIServiceProtocol
    private let recipeURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json" // URL for fetching recipes
    
    // Dependency injection through the initializer
    init(service: APIServiceProtocol) {
        self.service = service
    }

    // Function to load recipes using async/await
    func loadRecipes() async {
        state = .loading // Update state to loading
        
        do {
            let fetchedRecipes = try await service.fetchRecipes(from: recipeURLString)
            
            if fetchedRecipes.isEmpty {
                state = .error("No recipes available.") // Update state if no recipes
            } else {
                state = .loaded(fetchedRecipes) // Update state with fetched recipes
            }
        } catch APIServiceError.emptyData {
            state = .error("No recipes available.") // Handle empty data case
        } catch APIServiceError.malformedData {
            state = .error("Failed to load recipes due to malformed data.") // Handle malformed data
        } catch {
            state = .error(error.localizedDescription) // Handle any other errors
        }
    }
}
