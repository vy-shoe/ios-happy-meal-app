//
//  MealData.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation

struct MealData: Decodable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strIngredient: [Array<String>]
    let strMeasure: [Array<String>]
    let strCategory: String
    
    
}
