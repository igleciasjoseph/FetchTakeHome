//
//  RecipeViewModel.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let recipeURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"

    private let apiService = APIService()

    // Function to load recipes using async/await
    func loadRecipes() async {
        isLoading = true
        do {
            let fetchedRecipes = try await apiService.fetchRecipes(from: recipeURLString)
            recipes = fetchedRecipes
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
