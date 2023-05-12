//
//  DishModel.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 10.05.2023.
//

import Foundation

struct DishModel: Codable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
