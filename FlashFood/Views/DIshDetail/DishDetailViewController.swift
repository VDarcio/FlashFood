//
//  DishDetailViewController.swift
//  FlashFood
//
//  Created by VD on 04/09/2021.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {

    
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var DIshTitleLabel: UILabel!
    @IBOutlet weak var CaloriesLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    
    static var dishID = ""
    static var buyerName = ""
    
    
    
    
    
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
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else{
            ProgressHUD.showError("please enter your name")
            return
        }
        DishDetailViewController.dishID = dish.id ?? ""
        DishDetailViewController.buyerName = (nameField.text?.trimmingCharacters(in: .whitespaces))!
        let paymentVC = PaymentViewController.instantiate()
        paymentVC.modalTransitionStyle = .coverVertical
        paymentVC.modalPresentationStyle = .fullScreen
        self.present(paymentVC, animated: true, completion: nil)
        
        
        
        
        
    }
    
    static func placeOrder(_ Dish: String,_ Buyer: String){
        
        ProgressHUD.show("Placing order...")
        NetworkService.shared.placeOrder(dishiD: Dish, name: Buyer) { result in
            
            switch result{
            
            case .success(let order):
                guard let DishName = order.dish!.name else {return}
                ProgressHUD.showSuccess("Thanks for your order, your \(DishName) will be arriving in 25 minutes")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
}
