//
//  ApiResponse.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 12.05.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
