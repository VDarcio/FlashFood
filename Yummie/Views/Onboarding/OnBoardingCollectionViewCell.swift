//
//  OnBoardingCollectionViewCell.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideimageView: UIImageView!
    @IBOutlet weak var slidetitleLabel: UILabel!
    @IBOutlet weak var slidedescriptionLabel: UILabel!
    
    func setup (_ slide:OnBoardingSlide){
        
        slideimageView.image = slide.image
        slidetitleLabel.text = slide.title
        slidedescriptionLabel.text = slide.description
    }
    
}
