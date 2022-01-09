//
//  Recipe Model.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/7/22.
//

import Foundation

//Recipe object
//New features can be added - must update RequestManager and optionally RecipeViewController
struct Recipe {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strIngredients: [String?]?
    let strMeasurements: [String?]?
//    let strMealThumb: String?
}


