//
//  OrderModel.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import Foundation

struct OrderModel : Codable {
    let id: String?
    let name: String?
    let dish: DishModel?
}
