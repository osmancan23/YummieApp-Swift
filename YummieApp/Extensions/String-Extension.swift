//
//  String-Extension.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 9.05.2023.
//

import Foundation

extension String {
    
    
    var asUrl : URL? {
        return URL(string: self)
    }
}
