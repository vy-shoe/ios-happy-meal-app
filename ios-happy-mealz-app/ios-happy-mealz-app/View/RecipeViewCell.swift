//
//  RecipeViewCell.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/7/22.
//

import UIKit

class RecipeViewCell: UITableViewCell {

    
    @IBOutlet weak var measurement: UILabel!
    @IBOutlet weak var ingredient: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
