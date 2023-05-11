//
//  DishDetailViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishCalorieLabel: UILabel!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    var dish : DishModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup()  {
        dishDescriptionLabel.text = dish.description
        dishCalorieLabel.text = dish.formattedCalories
        dishNameLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
    }
    
    @IBAction func sendPlaceOrder(_ sender: Any) {
    }
    
    

}
