//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by VD on 04/09/2021.
//

import Foundation
import UIKit


//extension to prevent you from instatiating a vnew viewcontroller multiple times

extension UIViewController{
    
    static var identifier :String{
        return String(describing: self)
    }
    
    static func instantiate() ->Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: identifier) as! Self
        
        return controller
        
    }
}
