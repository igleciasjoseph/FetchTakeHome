//
//  MockRecipeService.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/12/24.
//

import Foundation

class MockRecipeService: APIServiceProtocol {
    
    func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        
        return [
            Recipe(cuisine: "Italian", name: "Spaghetti", photoUrlLarge: "", photoUrlSmall: "", sourceUrl: "", uuid: UUID(), youtubeUrl: "")
        ]
    }
}
