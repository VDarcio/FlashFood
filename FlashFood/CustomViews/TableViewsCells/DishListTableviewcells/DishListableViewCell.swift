//
//  DishListableViewCell.swift
//  FlashFood
//
//  Created by VD on 05/09/2021.
//

import UIKit
import Kingfisher

class DishListableViewCell: UITableViewCell {

    
    static let identifier = "DishListableViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var DishtitleLabel: UILabel!
    @IBOutlet weak var DishDescriptionlbl: UILabel!
    
    
    func setup ( _ dish : Dish){
        
        dishImageView.kf.setImage(with: dish.image?.asURL)
        DishtitleLabel.text = dish.name
        DishDescriptionlbl.text = dish.description
    }
    
    func setup( order : Order){
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        DishtitleLabel.text = order.dish?.name
        DishDescriptionlbl.text = order.name
        
    }
    
}
