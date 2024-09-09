//
//  MealDetailViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/6/24.
//

import Foundation

class MealDetailViewModel: BaseViewModel {
    @Published private(set) var mealDetail: MealDetail?
    
    func getMealDetail(by mealId: String) async {
        viewState = .loading
        do {
            mealDetail = try await networkManager.getMealDetail(by: mealId)
            viewState = .finished
        } catch let error {
            setErrorMessage(with: error)
        }
    }
}
