//
//  DishPortraitCollectionViewCell.swift
//  FlashFood
//
//  Created by VD on 03/09/2021.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {

  static let  indentifier = "DishPortraitCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var descrpitionLabel: UILabel!
    @IBOutlet weak var CaloriesLabel: UILabel!
    
    func setup (_ dish: Dish){
        titleLabel.text = dish.name
        DishImageView.kf.setImage(with: dish.image?.asURL)
        CaloriesLabel.text = dish.formatedCalories
        descrpitionLabel.text = dish.description
    }
    
}
