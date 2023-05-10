//
//  OnboardCollectionViewCell.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 8.05.2023.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = String(describing: OnboardCollectionViewCell.self)
    
    func setup(onboard:OnboardModel)  {
        imageView.image = onboard.image
        titleLabel.text = onboard.title
        descriptionLabel.text = onboard.description
    }
}
