//
//  ViewController.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/6/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create label animation for welcome screen revealing app name
        welcomeLabel.text = ""
        var charIndex = 0.0;
        let titleText = "Welcome to \(K.appName)"
        for letter in titleText {
        Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
        self.welcomeLabel.text?.append(letter)
        }
        charIndex += 1
        }
    }
    
    
}

