//
//  Route.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 12.05.2023.
//

import Foundation

enum Route {
    
    static let baseUrl  = "https://yummie.glitch.me"
    
    case temp
    
    var description : String {
        
        switch self {
            case .temp : return "/dishes/cat1"
        }
    }
    
}
