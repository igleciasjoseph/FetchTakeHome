//
//  RecipeState.swift
//  FetchTakeHome
//
//  Created by Joseph Iglecias on 10/12/24.
//

import Foundation

enum RecipeState {
    case idle
    case loading
    case loaded([Recipe])
    case error(String)
}
