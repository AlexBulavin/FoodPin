//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Alex on 03.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//


import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
        
    }
    
}
