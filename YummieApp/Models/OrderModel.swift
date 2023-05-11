//
//  OrderModel.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import Foundation

struct OrderModel : Decodable {
    let id: String?
    let name: String?
    let dish: DishModel?
}
