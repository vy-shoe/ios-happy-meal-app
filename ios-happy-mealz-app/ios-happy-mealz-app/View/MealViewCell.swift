//
//  MealViewCell.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/7/22.
//

import UIKit

class MealViewCell: UITableViewCell {
    
    
    @IBOutlet weak var meal: UIButton!
    var delegate: MealCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonPressed(_ sender: Any) {
        if (self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: meal.currentTitle ?? "No Meal Selected")
        }
    }
}
