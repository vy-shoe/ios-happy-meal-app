//
//  RequestManager.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation



struct RequestManager {
    let categoryURL     = "https://www.themealdb.com/api/json/v1/1/categories.php"
    let mealsURL        = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    let idURL           = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    func fetchCategories() {
        performRequest(urlString: categoryURL)
    }
    
    func fetchMealsByCategory(category: String) {
        let url = mealsURL+"\(category)"
        performRequest(urlString: url)
    }
    
    func fetchMeal(mealID: String) {
        performRequest(urlString: categoryURL)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler:  handle(data: response: error: ))
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return //exit out of ifunction, dont continue bc it failed
//                }
//                if let safeData = data {
//                    print(safeData)
//                    if let category = self.parseJSON(urlData: safeData, requestType: requestType) {
//                        print(category)
////                    }
//                }
            task.resume()
            }
        }
    }

func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return //exit out of function, dont continue bc it failed
        }
        if let safeData = data {
            //convert data into string
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "No data found")
        }
    }
