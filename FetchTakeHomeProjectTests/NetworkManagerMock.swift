//
//  NetworkManagerMock.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jeff Chien on 9/8/24.
//

import Foundation
@testable import FetchTakeHomeProject

class NetworkManagerMock: NetworkManagerProtocol {
    
    var hasError = false
    
    var meals: [Meal] {
        [Meal(id: "123", name: "test", thumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")]
    }
    
    var ingredients: [Ingredient] {
        [Ingredient(name: "abc", measure: "1")]
    }
    
    var mealDetail: MealDetail {
        MealDetail(id: "123", name: "test", category: "desert", instructions: "one two three four five", thumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", area: "USA", ingredients: ingredients, drinkAlternate: nil, tags: nil, youtube: nil, source: nil, imageSource: nil, creativeCommonsConfirmed: nil, dateModified: nil)
    }
    
    func getMealList() async throws -> FetchTakeHomeProject.MealList {
        if !hasError {
            return MealList(meals: meals)
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func getMealDetail(by mealId: String) async throws -> FetchTakeHomeProject.MealDetail? {
        if !hasError {
            return mealDetail
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
