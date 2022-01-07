//
//  CategoryViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var requestManager = RequestManager()
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestManager.delegate = self
        requestManager.fetchCategories()
        
    }
    
//    func loadCategories() {
//        
//    }
}


//MARK: - RequestManagerDelegate
extension CategoryViewController: RequestManagerDelegate {
    func didGetRequest(_ requestManager: RequestManager, resultData: Any) {
        categories = resultData as! [Category]
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellReuseIdentifier: "CategoryReusableCell")
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = categories.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryName = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryReusableCell", for: indexPath) as! CategoryViewCell
        cell.label.text = categoryName.strCategory
        return cell
    }
}
