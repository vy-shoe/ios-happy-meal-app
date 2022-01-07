//
//  RequestManager.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation


protocol RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any)
    func didFailWithError(error: Error)
}


class RequestManager {
    let categoryURL     = "https://www.themealdb.com/api/json/v1/1/categories.php"
    let mealsURL        = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    let idURL           = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    var delegate: RequestManagerDelegate?
    var requestType = ""
    var mealList = [Meal]()
    
    
    func fetchCategories() {
        requestType = "category"
        performRequest(urlString: categoryURL)
        
    }
    
    func fetchMealsByCategory(category: String) {
        print(category)
        requestType = "mealsByCategory"
        let url = mealsURL+"\(category)"
        performRequest(urlString: url)
    }
    
    func fetchMeal(mealID: String) {
        requestType = "mealID"
        let url = idURL+"\(mealID)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url, completionHandler:  handle(data: response: error: ))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil { //if there is no error
                    if let safeData = data {
                        switch self.requestType {
                        case "category":
                            self.parseCategories(safeData: safeData)
                        case "mealsByCategory":
                            self.parseMealsByCategory(safeData: safeData)
                        case "mealID":
                            self.parseMeal(safeData:safeData)
                        default:
                            print("No parsing of data occurred")
                        }
                        
                        
                    }
                    
                }
            }
            
            
            task.resume()
        }
    }
        
    func parseCategories(safeData: Data) {
        var categoryList = [Category]()
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Results.self, from: safeData)
            for c in decodedData.categories! {
                let newCategoryName = c.strCategory
                let newCategory = Category(strCategory: newCategoryName)
                categoryList.append(newCategory)
            }
            categoryList = categoryList.sorted(by: { (c1, c2) -> Bool in
                let c1_Name = c1.strCategory
                let c2_Name = c2.strCategory
                return (c1_Name.localizedCaseInsensitiveCompare(c2_Name) == .orderedAscending)
             })
            DispatchQueue.main.async {
                self.delegate?.didGetRequest(self, resultData: categoryList)
            }
            
        } catch {
            delegate?.didFailWithError(error: error)
        }
        
    }
    
    func parseMealsByCategory(safeData: Data) {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Results.self, from: safeData)
            if decodedData.meals != nil {
                for m in decodedData.meals! {
                    print(m)
                    let id = m.idMeal
                    let strMeal = m.strMeal
                    
                    let meal = Meal(idMeal: id, strMeal: strMeal)
                    self.mealList.append(meal)
                }
            }
            print(self.mealList)
            
            self.mealList = self.mealList.sorted(by: { (c1, c2) -> Bool in
                let c1_Name = c1.strMeal
                let c2_Name = c2.strMeal
                return (c1_Name.localizedCaseInsensitiveCompare(c2_Name) == .orderedAscending)
             })
            DispatchQueue.main.async {
                self.delegate?.didGetRequest(self, resultData: self.mealList)
            }
            
        } catch {
            delegate?.didFailWithError(error: error)
        }
    }
    
    func parseMeal(safeData: Data) {
        
    }
}
