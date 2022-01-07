//
//  MealModel.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation
struct MealModel {
    let mealID: String
    let mealDesc: String
    let instructions: String
    let ingredient: [Array<String>]
    let measure: [Array<String>]
    let mealThumb: String?
}
