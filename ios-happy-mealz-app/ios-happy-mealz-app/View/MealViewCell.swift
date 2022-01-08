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
//        imageView.downloaded(from: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")

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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
