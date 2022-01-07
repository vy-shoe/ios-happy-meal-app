//
//  RequestManager.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation



struct RequestManager {
    let categoryURL     = "www.themealdb.com/api/json/v1/1/categories.php"
    let mealsURL        = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    let idURL           = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    func fetchCategories() {
        performRequest(urlString: categoryURL, requestType: "category")
    }
    
    
    func performRequest(urlString: String, requestType: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return //exit out of ifunction, dont continue bc it failed
                }
                if let safeData = data {
                    print(safeData)
//                    if let category = self.parseJSON(urlData: safeData, requestType: requestType) {
//                        print(category)
//                    }
                }
            }
            task.resume()
        }
    }
}
