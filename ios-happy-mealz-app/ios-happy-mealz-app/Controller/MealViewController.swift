//
//  MealViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import UIKit

class MealViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    var categoryChosen: String = ""
    var requestManager = RequestManager()
    var meals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(categoryChosen)
        requestManager.delegate = self
        requestManager.fetchMealsByCategory(category: categoryChosen)
    }
    
    
}


//MARK: - RequestManagerDelegate
extension MealViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        meals = resultData as! [Meal]
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "MealViewCell", bundle: nil), forCellReuseIdentifier: "MealReusableCell")
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
