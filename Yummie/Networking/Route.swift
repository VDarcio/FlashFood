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
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrder
    
    var description :String{
        switch self{
        
        case .fetchAllCAtegories: return "/dish-categories"
            
        case  .placeOrder (let dishId): return "/orders/\(dishId)"
            
        case .fetchCategoryDishes( let categoryId): return "/dishes/\(categoryId)"
            
        case .fetchOrder : return "/orders"
            
            
        }
    }
}
