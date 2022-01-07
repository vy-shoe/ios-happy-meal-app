//
//  CategoryViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    var requestManager = RequestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestManager.fetchCategories()
        
    }
}
