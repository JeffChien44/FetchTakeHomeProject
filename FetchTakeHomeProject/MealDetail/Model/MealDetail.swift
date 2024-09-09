//
//  MealDetail.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/6/24.
//

import Foundation

struct MealDetail {
    let id: String
    let name: String
    let category: String
    let instructions: String
    let thumb: String
    let area: String
    let ingredients: [Ingredient]
    let drinkAlternate: String?
    let tags: String?
    let youtube: String?
    let source: String?
    let imageSource: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
}

struct Ingredient {
    let name: String
    let measure: String
}

extension MealDetail {
    static func parseMealDetail(from data: Data) -> MealDetail? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let meals = jsonObject["meals"] as? [[String: Any]],
              let mealDeatil = meals.first else {
            return nil
        }
        
        guard let id = mealDeatil["idMeal"] as? String,
              let name = mealDeatil["strMeal"] as? String,
              let category = mealDeatil["strCategory"] as? String,
              let instructions = mealDeatil["strInstructions"] as? String,
              let thumb = mealDeatil["strMealThumb"] as? String,
              let area = mealDeatil["strArea"] as? String else {
            return nil
        }
        
        let drinkAlternate = mealDeatil["strDrinkAlternate"] as? String
        let tags = mealDeatil["strTags"] as? String
        let youtube = mealDeatil["strYoutube"] as? String
        let source = mealDeatil["strSource"] as? String
        let imageSource = mealDeatil["strImageSource"] as? String
        let creativeCommonsConfirmed = mealDeatil["strCreativeCommonsConfirmed"] as? String
        let dateModified = mealDeatil["dateModified"] as? String

        var ingredients = [Ingredient]()
        
        let ingredientKey = "strIngredient"
        let measureKey = "strMeasure"
        for i in 1...20 {
            if let ingredient = mealDeatil[ingredientKey + "\(i)"] as? String,
               let measure = mealDeatil[measureKey + "\(i)"] as? String,
               !ingredient.isEmpty,
               !measure.isEmpty {
                ingredients.append(Ingredient(name: ingredient, measure: measure))
            }
        }
        
        return MealDetail(id: id, name: name, category: category, instructions: instructions, thumb: thumb, area: area, ingredients: ingredients, drinkAlternate: drinkAlternate, tags: tags, youtube: youtube, source: source, imageSource: imageSource, creativeCommonsConfirmed: creativeCommonsConfirmed, dateModified: dateModified)
    }
}
