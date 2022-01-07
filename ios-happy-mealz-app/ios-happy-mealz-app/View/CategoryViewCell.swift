//
//  CategoryViewCell.swift
//  ios-happy-mealz-app
//
//  Created by Vaishu Adi on 1/7/22.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    @IBOutlet weak var label: UIButton!
    var delegate: CategoryCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.contentMode = .scaleToFill
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonPressed(_ sender: Any) {
        print(label.currentTitle!)
        if (self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: label.currentTitle ?? "No Category Selected")
        }
    }
    
}
