//
//  MealListViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/6/24.
//

import Foundation

class MealListViewModel: BaseViewModel {
    @Published private(set) var meals: [Meal] = []
    
    func getMealList() async {
        viewState = .loading
        do {
            let mealList = try await networkManager.getMealList()
            meals = mealList.meals.sorted()
            viewState = .finished
        } catch let error {
            setErrorMessage(with: error)
        }
    }
}
