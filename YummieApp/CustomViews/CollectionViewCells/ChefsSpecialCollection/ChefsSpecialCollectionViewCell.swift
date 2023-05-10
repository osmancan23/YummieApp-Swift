//
//  ChefsSpecialCollectionViewCell.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 10.05.2023.
//

import UIKit

class ChefsSpecialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var specialCalorieLabel: UILabel!
    
    @IBOutlet weak var specialDescriptionLabel: UILabel!
    @IBOutlet weak var specialTitleLabel: UILabel!
    @IBOutlet weak var specialmageView: UIImageView!
    
    static let identifier = String(describing: ChefsSpecialCollectionViewCell.self)
    
    func setup(dish:DishModel)  {
        specialmageView.kf.setImage(with: dish.image?.asUrl)
        specialTitleLabel.text = dish.name
        specialDescriptionLabel.text = dish.description
        specialCalorieLabel.text = dish.formattedCalories
    }

}
