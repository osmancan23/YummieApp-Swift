//
//  DishListTableViewCell.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    @IBOutlet weak var dishListDescriptionLabel: UILabel!
    @IBOutlet weak var dishListTitleLabel: UILabel!
    @IBOutlet weak var dishListImageView: UIImageView!
    
   static let identifier = String(describing: DishListTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(dishModel:DishModel)  {
        dishListTitleLabel.text = dishModel.name
        dishListDescriptionLabel.text = dishModel.description
        dishListImageView.kf.setImage(with: dishModel.image?.asUrl)
    }
    
}
