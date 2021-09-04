//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by VD on 04/09/2021.
//

import UIKit

class DishDetailViewController: UIViewController {

    
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var DIshTitleLabel: UILabel!
    @IBOutlet weak var CaloriesLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
populateView()
       
    }
    
    
    private func populateView(){
        DishImageView.kf.setImage(with: dish.image?.asURL)
        DIshTitleLabel.text = dish.name
        DescriptionLabel.text = dish.description
        CaloriesLabel.text = dish.formatedCalories
    }

    @IBAction func placeOrderPressed(_ sender: Any) {
    }
    
}
