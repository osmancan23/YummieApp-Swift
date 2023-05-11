//
//  UIViewController-Extension.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var identifier: String {
            return String(describing: self)
        }
    
   static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
