//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel(service: APIService())
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .idle:
                    Text("Welcome! Pull to refresh.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                
                case .loading:
                    ProgressView("Loading recipes...")
                
                case .loaded(let recipes):
                    if recipes.isEmpty {
                        Text("No recipes available")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        List(recipes, id: \.uuid) { recipe in
                            RecipeDetailView(recipe: recipe, viewModel: viewModel)
                        }
                    }
                
                case .error(let message):
                    Text("Error: \(message)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.loadRecipes() // Load recipes when the view appears
            }
            .refreshable {
                await viewModel.loadRecipes() // Refresh recipes on pull down
            }
        }
    }
}
