//
//  AllDishesModel.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 12.05.2023.
//

import Foundation

struct AllDishesModel : Codable {
    let categories: [DishCategoryModel]?
    let populars: [DishModel]?
    let specials: [DishModel]?
}
