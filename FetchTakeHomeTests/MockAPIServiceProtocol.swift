//
//  MockAPIServiceProtocol.swift
//  FetchTakeHomeTests
//
//  Created by Joseph Iglecias on 10/12/24.
//

import Foundation
@testable import FetchTakeHome

class MockAPIServiceProtocol: APIServiceProtocol {
    func fetchRecipes(from urlString: String) async throws -> [FetchTakeHome.Recipe] {
        return [
            Recipe(cuisine: "Italian", name: "Spaghetti", photoUrlLarge: "", photoUrlSmall: "", sourceUrl: "", uuid: UUID(), youtubeUrl: "")
        ]
    }
}
