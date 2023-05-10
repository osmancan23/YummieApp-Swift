//
//  CategoryCollectionViewCell.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 9.05.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    
    
    
    func setup(dishCategory:DishCategoryModel)  {
        categoryLabel.text = dishCategory.title
        categoryImageView.kf.setImage(with: dishCategory.image.asUrl)
        
        
    }
    

}
