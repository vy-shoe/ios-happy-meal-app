//
//  RequestManager.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation


protocol RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Data)
    func didFailWithError(error: Error)
}


struct RequestManager {
    let categoryURL     = "https://www.themealdb.com/api/json/v1/1/categories.php"
    let mealsURL        = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    let idURL           = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    var delegate: RequestManagerDelegate?
    var requestType = ""
    
    mutating func fetchCategories() {
        requestType = "category"
        performRequest(urlString: categoryURL)
        
    }
    
    mutating func fetchMealsByCategory(category: String) {
        requestType = "meals"
        let url = mealsURL+"\(category)"
        performRequest(urlString: url)
    }
    
    mutating func fetchMeal(mealID: String) {
        requestType = "mealID"
        let url = idURL+"\(mealID)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler:  handle(data: response: error: ))
            task.resume()
        }
    }
        
func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            delegate?.didFailWithError(error: error!)
            return //exit out of function, dont continue bc it failed
        }
        if let safeData = data {
            //convert data into string
//            let dataString = String(data: safeData, encoding: .utf8)
            self.delegate?.didGetRequest(self, resultData: safeData)
        }
    }
    
}
