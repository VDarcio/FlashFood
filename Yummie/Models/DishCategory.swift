//
//  DIshCategory.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import Foundation


struct DishCategory : Decodable{
    let id, name, image : String?
    
    
    enum CodingKeys : String, CodingKey{
        
        case id
        case name = "title"
        case image
    }
}
