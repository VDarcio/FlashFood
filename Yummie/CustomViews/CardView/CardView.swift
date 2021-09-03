//
//  CardView.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import Foundation
import UIKit

// class to inherit from so views can have shadow arround them

class CardView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerradius = 10
        
    }
}
