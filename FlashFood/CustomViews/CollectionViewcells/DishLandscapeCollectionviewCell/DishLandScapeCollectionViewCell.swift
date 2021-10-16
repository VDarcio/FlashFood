//
//  DishLandScapeCollectionViewCell.swift
//  FlashFood
//
//  Created by VD on 03/09/2021.
//

import UIKit
import  Kingfisher

class DishLandScapeCollectionViewCell: UICollectionViewCell {

   static let identifier = "DishLandScapeCollectionViewCell"
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(_ dish : Dish){
        
        dishImageView.kf.setImage(with: dish.image?.asURL)
        title.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formatedCalories
    }
    
}
