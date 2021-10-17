//
//  AllDishes.swift
//  FlashFood
//
//  Created by VD on 06/09/2021.
//

import Foundation


struct AllDishes : Decodable {
    let categories : [DishCategory]?
    let populars :[Dish]?
    let specials : [Dish]?
}
