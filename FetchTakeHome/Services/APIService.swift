//
//  APIService.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import Foundation

// Define possible errors for APIService
enum APIServiceError: Error, LocalizedError, Equatable {
    case invalidURL
    case requestFailed
    case malformedData
    case emptyData
    case decodingFailed(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed:
            return "The request failed. Please check your network connection."
        case .malformedData:
            return "Recipes are malformed."
        case .emptyData:
            return "No recipes available."
        case .decodingFailed(let details):
            return "Failed to decode the data: \(details)"
        }
    }
}

class APIService {
    
    func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw APIServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIServiceError.requestFailed
        }
        
        // Decode the response
        do {
            let recipeResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
            
            // Only required properties
            for recipe in recipeResponse.recipes {
                if recipe.name == nil || recipe.cuisine == nil || recipe.photoUrlLarge == nil{
                    throw APIServiceError.malformedData
                }
            }
            
            // check if empty
            if recipeResponse.recipes.isEmpty {
                return []
            }
            
            return recipeResponse.recipes
        } catch {
            throw APIServiceError.malformedData
        }
    }
}

