//
//  MealList.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/5/24.
//

import Foundation

struct MealList: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Comparable {
    let id: String
    let name: String
    let thumb: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        thumb = try container.decode(String.self, forKey: .thumb)
        id = try container.decode(String.self, forKey: .id)
    }
    
    init(id: String, name: String, thumb: String) {
        self.id = id
        self.name = name
        self.thumb = thumb
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumb = "strMealThumb"
        case id = "idMeal"
    }
    
    static func <(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name < rhs.name
    }
}
