//
//  Order.swift
//  FlashFood
//
//  Created by VD on 05/09/2021.
//

import Foundation


struct Order: Decodable{
    
    let id, name : String?
    
    let dish : Dish?
}
