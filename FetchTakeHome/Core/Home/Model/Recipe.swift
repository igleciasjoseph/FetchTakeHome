//
//  Recipe.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable {
    let cuisine: String?
    let name: String?
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let uuid: UUID?
    let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case uuid
        case youtubeUrl = "youtube_url"
    }
}
