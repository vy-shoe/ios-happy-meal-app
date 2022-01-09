//
//  CategoryViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import UIKit

protocol CategoryCellDelegate {
    func callSegueFromCell(myData: String)
}

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var categoryChosen = ""
    
    var requestManager = RequestManager()
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestManager.delegate = self
        requestManager.fetchCategories()
        
    }

}


//MARK: - RequestManagerDelegate
extension CategoryViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        categories = resultData as! [Category]
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.categoryNib, bundle: nil), forCellReuseIdentifier: K.categoryIdentifier)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: -TableView
extension CategoryViewController: UITableViewDataSource, CategoryCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = categories.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryName = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryIdentifier, for: indexPath) as! CategoryViewCell
        cell.label.setTitle("\(categoryName.strCategory)", for: .normal)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectCell cell: CategoryViewCell, onIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK: - MyCustomCellDelegator Methods

     func callSegueFromCell(myData : String) {
         categoryChosen = myData
         self.performSegue(withIdentifier: K.categorySegue, sender: self)
         
     }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MealViewController
        destinationVC.categoryChosen = categoryChosen
    }
}
