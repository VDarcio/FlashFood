//
//  Dish.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import Foundation


struct Dish {
    let id : String?
    let name: String?
    let description : String?
    let calories : Int?
    let image :String?
    
    var formatedCalories :String{
        return "\(calories ?? 0) calories"
    }
}
