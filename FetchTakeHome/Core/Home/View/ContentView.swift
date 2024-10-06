//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading recipes...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes available")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    
                    List(viewModel.recipes, id: \.uuid) { recipe in
                        RecipeDetailView(recipe: recipe, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                if viewModel.recipes.isEmpty {
                    await viewModel.loadRecipes()
                }
            }
            .refreshable {
                await viewModel.loadRecipes()
            }
        }
    }
}

