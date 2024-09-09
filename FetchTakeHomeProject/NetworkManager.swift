//
//  NetworkManager.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/5/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func getMealList() async throws -> MealList
    func getMealDetail(by mealId: String) async throws -> MealDetail?
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    static let mealListEndPoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let mealDetailEndPoint = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    func sendRequest(with urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    func getMealList() async throws -> MealList {
        let data = try await sendRequest(with: NetworkManager.mealListEndPoint)
        let mealList = try JSONDecoder().decode(MealList.self, from: data)
        
        return mealList
    }
    
    func getMealDetail(by mealId: String) async throws -> MealDetail? {        
        let data = try await sendRequest(with: NetworkManager.mealDetailEndPoint + mealId)
        
        return MealDetail.parseMealDetail(from: data)
    }
}
