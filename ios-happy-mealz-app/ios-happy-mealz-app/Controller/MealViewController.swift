//
//  MealViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import UIKit

protocol MealCellDelegate {
    func callSegueFromCell(myData: String)
}

class MealViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var categoryChosen: String = "Default"
    var requestManager = RequestManager()
    var meals: [Meal] = []
    var mealChosen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestManager.delegate = self
        callRequest()
        
    }
    
    func callRequest()  {
        requestManager.fetchMealsByCategory(category: categoryChosen)
        
    }
    
    
}


//MARK: - RequestManagerDelegate
extension MealViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        meals = resultData as! [Meal]
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MealViewCell", bundle: nil), forCellReuseIdentifier: "MealReusableCell")
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: -TableView
extension MealViewController: UITableViewDataSource, MealCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = meals.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mealName = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealReusableCell", for: indexPath) as! MealViewCell
        cell.meal.setTitle("\(mealName.strMeal)", for: .normal)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectCell cell: CategoryViewCell, onIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK: - MyCustomCellDelegator Methods

     func callSegueFromCell(myData : String) {
         mealChosen = myData
         self.performSegue(withIdentifier: "mealSelectedSegue", sender: self)
         
     }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RecipeViewController
        if let chosenMeal = meals.first(where: { $0.strMeal == mealChosen }) {
            let id = chosenMeal.idMeal
            destinationVC.mealID = id
        } else {
            print("Meal not found.")
        }
        
    }
}
