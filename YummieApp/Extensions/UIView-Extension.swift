//
//  UIView-Extension.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 8.05.2023.
//

import Foundation
import UIKit

extension UIView {
    
   @IBInspectable var cornerRadius : CGFloat{
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            
        }
    }
}
