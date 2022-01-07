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
    var categories: [Array<String>]?
    
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
//        resultData
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
