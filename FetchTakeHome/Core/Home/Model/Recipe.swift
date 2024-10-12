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
    
    // Custom initializer for manual instantiation
    init(
        cuisine: String?,
        name: String?,
        photoUrlLarge: String?,
        photoUrlSmall: String?,
        sourceUrl: String?,
        uuid: UUID?,
        youtubeUrl: String?
    ) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.uuid = uuid
        self.youtubeUrl = youtubeUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode optional properties
        cuisine = try container.decodeIfPresent(String.self, forKey: .cuisine)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        photoUrlLarge = try container.decodeIfPresent(String.self, forKey: .photoUrlLarge)
        photoUrlSmall = try container.decodeIfPresent(String.self, forKey: .photoUrlSmall)
        sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        
        // Handle UUID decoding, setting to nil if not present or invalid
        if let uuidString = try container.decodeIfPresent(String.self, forKey: .uuid), let uuidValue = UUID(uuidString: uuidString) {
            uuid = uuidValue
        } else {
            uuid = nil // Set to nil if UUID is not valid or not present
        }
        
        youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)
    }
}
