//
//  MealData.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation

struct Results: Decodable {
    let categories: [Category]
}

struct Category: Decodable, Encodable {
    let strCategory: String?
}

struct MealData: Decodable, Encodable {
    let idMeal: String?
    let strMeal: String?
    let strInstructions: String?
    let strIngredient: [Array<String>]?
    let strMeasure: [Array<String>]?
    let strMealThumb: String?
}
