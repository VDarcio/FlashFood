//
//  String+Extension.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import Foundation

//extension to turn URL into a string

extension String{
    var  asURL : URL?{
        return URL(string: self)
    }
}
