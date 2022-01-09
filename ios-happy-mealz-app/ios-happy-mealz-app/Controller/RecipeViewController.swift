//
//  DetailViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UILabel!
    var mealID : String = ""
    @IBOutlet weak var instructions: UILabel!
    var requestManager = RequestManager()
    @IBOutlet weak var tableView: UITableView!
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestManager.delegate = self
        requestManager.fetchMeal(mealID: mealID)
    }
    
}

//MARK: - RequestManagerDelegate
extension RecipeViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        //once request has been sent, assign recipe components and register data table
        recipe = resultData as? Recipe
        if recipe != nil {
            recipeName.text = recipe.strMeal
            instructions.text = recipe.strInstructions
            tableView.dataSource = self
            tableView.register(UINib(nibName: "RecipeViewCell", bundle: nil), forCellReuseIdentifier: "RecipeReusableCell")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: -TableView
extension RecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = recipe?.strIngredients?.count ?? 0
        return count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //assign custom table cell with received data
        let meas = recipe?.strMeasurements![indexPath.row]
        let ing = recipe?.strIngredients![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeReusableCell", for: indexPath) as! RecipeViewCell
        cell.measurement.text = meas
        cell.ingredient.text = ing
        return cell
    }
}
