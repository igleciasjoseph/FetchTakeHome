//
//  APIServiceProtocol.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/12/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRecipes(from urlString: String) async throws -> [Recipe]
}
