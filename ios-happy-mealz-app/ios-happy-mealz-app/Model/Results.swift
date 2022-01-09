//
//  MealData.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation
protocol PropertyReflectable { }

extension PropertyReflectable {
    subscript(key: String) -> Any? {
        let m = Mirror(reflecting: self)
        return m.children.first { $0.label == key }?.value
    }
}

extension Results : PropertyReflectable {}
extension Meals : PropertyReflectable {}


class Results: Decodable {
    var categories: [Category]?
    var meals: [Meals]?
    var recipe: Meals?
    
    
    
}

struct Category: Decodable, Encodable {
    let strCategory: String
}

// Meals JSON structure from API- not formatted well as a database, but it's needed to decode using JSONDecoder
struct Meals: Decodable, Encodable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2 : String?
    let strIngredient3 :  String?
    let strIngredient4 :  String?
    let strIngredient5 :  String?
    let strIngredient6 :  String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 :  String?
    let strIngredient10 :  String?
    let strIngredient11 :  String?
    let strIngredient12 :  String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 :  String?
    let strIngredient16 :  String?
    let strIngredient17 :  String?
    let strIngredient18 :  String?
    let strIngredient19 :  String?
    let strIngredient20 :  String?
    
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    let strMeasure16 : String?
    let strMeasure17 : String?
    let strMeasure18 : String?
    let strMeasure19 : String?
    let strMeasure20 : String?
}

