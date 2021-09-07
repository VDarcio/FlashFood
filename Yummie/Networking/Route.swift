//
//  Route.swift
//  Yummie
//
//  Created by VD on 05/09/2021.
//

import Foundation


enum Route {
    
    static let baseURL = "https://yummie.glitch.me"
    
    case fetchAllCAtegories
    
    var description :String{
        switch self{
        
        case .fetchAllCAtegories: return "/dish-categories"
            
        }
    }
}
