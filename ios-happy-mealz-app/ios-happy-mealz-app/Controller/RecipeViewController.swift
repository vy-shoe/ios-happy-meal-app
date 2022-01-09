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
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestManager.delegate = self
        callRequest()
    }
    
    func callRequest()  {
        print(mealID)
        requestManager.fetchMeal(mealID: mealID)
    }
}

//MARK: - RequestManagerDelegate
extension RecipeViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        if let recipe = resultData as? Recipe {
            recipeName.text = recipe.strMeal
            instructions.text = recipe.strInstructions
            tableView.dataSource = self
            tableView.register(UINib(nibName: "RecipeViewCell", bundle: nil), forCellReuseIdentifier: "RecipeReusableCell")
            print("hello1")
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: -TableView
extension RecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count = recipe.allIngredients()
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let measurement = recipe.measurements[indexPath.row]
//        let ingredient = recipe.ingredients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeReusableCell", for: indexPath) as! RecipeViewCell
        cell.measurement.text = "1/2 cup"
        cell.ingredient.text = "elu"
        return cell
    }
}
