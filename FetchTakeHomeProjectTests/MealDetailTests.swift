//
//  MealDetailTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jeff Chien on 9/8/24.
//

import XCTest
@testable import FetchTakeHomeProject

final class MealDetailTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Parse_Meal_Detail() {
        let jsonObject: [String: Any] = [
            "meals": [
                [
                    "idMeal": "52892",
                    "strMeal": "Treacle Tart",
                    "strDrinkAlternate": nil,
                    "strCategory": "Dessert",
                    "strArea": "British",
                    "strInstructions": "First make the short crust pastry: measure the flour into a large bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs (alternatively, this can be done in a food processor). Add about three tablespoons of cold water and mix to a firm dough, wrap in cling film and chill in the fridge for about 20 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 and put a heavy baking tray in the oven to heat up. Grease a deep 18cm/7in loose-bottomed fluted flan tin with butter.\r\nRemove about 150g/5½oz of pastry from the main ball and set aside for the lattice top.\r\nRoll the rest of the pastry out thinly on a lightly floured work surface and line the prepared flan tin with the pastry.\r\nPrick the base with a fork, to stop the base rising up during baking.\r\nPlace the reserved pastry for the lattice top on cling film and roll out thinly. Egg wash the pastry and set aside to chill in the fridge (the cling film makes it easier to move about). Do not cut into strips at this stage. Do not egg wash the strips once they are on the tart as it will drip into the treacle mixture.\r\nTo make the filling, heat the syrup gently in a large pan but do not boil.\r\nOnce melted, add the breadcrumbs, lemon juice and zest to the syrup. (You can add less lemon if you would prefer less citrus taste.) If the mixture looks runny, add a few more breadcrumbs.\r\nPour the syrup mixture into the lined tin and level the surface.\r\nRemove the reserved pastry from the fridge and cut into long strips, 1cm/½in wide. Make sure they are all longer than the edges of the tart tin.\r\nEgg wash the edge of the pastry in the tin, and start to make the woven laying lattice pattern over the mixture, leave the strips hanging over the edge of the tin.\r\nOnce the lattice is in place, use the tin edge to cut off the strips by pressing down with your hands, creating a neat finish.\r\nBake on the pre-heated baking tray in the hot oven for about 10 minutes until the pastry has started to colour, and then reduce the oven temperature to 180C/350F/Gas 4. If at this stage the lattice seems to be getting too dark brown, cover the tart with tin foil.\r\nBake for a further 25-30 minutes until the pastry is golden-brown and the filling set.\r\nRemove the tart from the oven and leave to firm up in the tin. Serve warm or cold.",
                    "strMealThumb": "https://www.themealdb.com/images/media/meals/wprvrw1511641295.jpg",
                    "strTags": "Tart",
                    "strYoutube": "https://www.youtube.com/watch?v=YMmgKCNcqwI",
                    "strIngredient1": "Plain Flour",
                    "strIngredient2": "Butter",
                    "strIngredient3": "Golden Syrup",
                    "strIngredient4": "Breadcrumbs",
                    "strIngredient5": "Lemons",
                    "strIngredient6": "Eggs",
                    "strIngredient7": "",
                    "strIngredient8": "",
                    "strIngredient9": "",
                    "strIngredient10": "",
                    "strIngredient11": "",
                    "strIngredient12": "",
                    "strIngredient13": "",
                    "strIngredient14": "",
                    "strIngredient15": "",
                    "strIngredient16": "",
                    "strIngredient17": "",
                    "strIngredient18": "",
                    "strIngredient19": "",
                    "strIngredient20": "",
                    "strMeasure1": "250g",
                    "strMeasure2": "135g",
                    "strMeasure3": "400g",
                    "strMeasure4": "150g",
                    "strMeasure5": "Zest of 2",
                    "strMeasure6": "1 beaten",
                    "strMeasure7": "",
                    "strMeasure8": "",
                    "strMeasure9": "",
                    "strMeasure10": "",
                    "strMeasure11": "",
                    "strMeasure12": "",
                    "strMeasure13": "",
                    "strMeasure14": "",
                    "strMeasure15": "",
                    "strMeasure16": "",
                    "strMeasure17": "",
                    "strMeasure18": "",
                    "strMeasure19": "",
                    "strMeasure20": "",
                    "strSource": "https://www.bbc.co.uk/food/recipes/mary_berrys_treacle_tart_28524",
                    "strImageSource": nil,
                    "strCreativeCommonsConfirmed": nil,
                    "dateModified": nil
                ]
            ]
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [])
        XCTAssertNotNil(jsonData)
        
        let mealDetail = MealDetail.parseMealDetail(from: jsonData!)
        XCTAssertNotNil(mealDetail)
        XCTAssertEqual(mealDetail!.id, "52892")
        XCTAssertEqual(mealDetail!.name, "Treacle Tart")
        XCTAssertEqual(mealDetail!.category, "Dessert")
        XCTAssertEqual(mealDetail!.area, "British")
        XCTAssertEqual(mealDetail!.instructions, "First make the short crust pastry: measure the flour into a large bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs (alternatively, this can be done in a food processor). Add about three tablespoons of cold water and mix to a firm dough, wrap in cling film and chill in the fridge for about 20 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 and put a heavy baking tray in the oven to heat up. Grease a deep 18cm/7in loose-bottomed fluted flan tin with butter.\r\nRemove about 150g/5½oz of pastry from the main ball and set aside for the lattice top.\r\nRoll the rest of the pastry out thinly on a lightly floured work surface and line the prepared flan tin with the pastry.\r\nPrick the base with a fork, to stop the base rising up during baking.\r\nPlace the reserved pastry for the lattice top on cling film and roll out thinly. Egg wash the pastry and set aside to chill in the fridge (the cling film makes it easier to move about). Do not cut into strips at this stage. Do not egg wash the strips once they are on the tart as it will drip into the treacle mixture.\r\nTo make the filling, heat the syrup gently in a large pan but do not boil.\r\nOnce melted, add the breadcrumbs, lemon juice and zest to the syrup. (You can add less lemon if you would prefer less citrus taste.) If the mixture looks runny, add a few more breadcrumbs.\r\nPour the syrup mixture into the lined tin and level the surface.\r\nRemove the reserved pastry from the fridge and cut into long strips, 1cm/½in wide. Make sure they are all longer than the edges of the tart tin.\r\nEgg wash the edge of the pastry in the tin, and start to make the woven laying lattice pattern over the mixture, leave the strips hanging over the edge of the tin.\r\nOnce the lattice is in place, use the tin edge to cut off the strips by pressing down with your hands, creating a neat finish.\r\nBake on the pre-heated baking tray in the hot oven for about 10 minutes until the pastry has started to colour, and then reduce the oven temperature to 180C/350F/Gas 4. If at this stage the lattice seems to be getting too dark brown, cover the tart with tin foil.\r\nBake for a further 25-30 minutes until the pastry is golden-brown and the filling set.\r\nRemove the tart from the oven and leave to firm up in the tin. Serve warm or cold.")
        XCTAssertEqual(mealDetail!.thumb, "https://www.themealdb.com/images/media/meals/wprvrw1511641295.jpg")
        XCTAssertEqual(mealDetail!.ingredients.count, 6)
    }
    
}
