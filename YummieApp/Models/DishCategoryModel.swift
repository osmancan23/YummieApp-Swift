//
//  DishCategoryModel.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 9.05.2023.
//

import Foundation

struct DishCategoryModel: Codable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
