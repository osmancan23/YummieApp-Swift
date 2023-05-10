//
//  PopularDishCollectionViewCell.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 10.05.2023.
//

import UIKit

class PopularDishCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dishTitleLabel: UILabel!
    
    @IBOutlet weak var dishCalorieLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    
    static let identifier = String(describing: PopularDishCollectionViewCell.self)
   
    
    func setup(dishModel: DishModel)  {
        dishTitleLabel.text = dishModel.name
        dishDescriptionLabel.text = dishModel.description
        dishCalorieLabel.text = dishModel.formattedCalories
        dishImageView.kf.setImage(with: dishModel.image?.asUrl)
    }
    
    
}
