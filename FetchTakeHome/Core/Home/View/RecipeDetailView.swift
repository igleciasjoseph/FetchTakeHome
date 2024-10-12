//
//  RecipeDetailView.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import SwiftUI
import CachedAsyncImage

struct RecipeDetailView: View {
    let recipe: Recipe
    @ObservedObject var viewModel: RecipeViewModel
    let urlCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Image loading
            if let photoUrl = recipe.photoUrlLarge, let url = URL(string: photoUrl) {
                CachedAsyncImage(url: url, urlCache: urlCache) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                        .frame(width: 60, height: 60)
                }
            }
            
            // Name and cuisine text
            Text(recipe.name ?? "")
                .font(.headline)
            
            Text(recipe.cuisine ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            if let link = URL(string: recipe.sourceUrl ?? "") {
                Link("Read More", destination: link)
            } else {
                Text("No More Information Is Available")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}
