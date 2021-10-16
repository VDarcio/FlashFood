//
//  ListDishesViewController.swift
//  FlashFood
//
//  Created by VD on 05/09/2021.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

   
    @IBOutlet weak var TableView: UITableView!
    var category : DishCategory!
    
    var dishes : [Dish] = [
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       title = category.name
        registercells()
        ProgressHUD.show()
        NetworkService.shared.fetchCAtegoryDishes(categoryId: category.id ?? "") { [weak self] result in
            
            
            switch result{
        
            case .success(let dishesFetched):
                ProgressHUD.dismiss()
                self?.dishes = dishesFetched
                self?.TableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registercells(){
        TableView.register(UINib(nibName: DishListableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListableViewCell.identifier)
        
    }

    
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: DishListableViewCell.identifier, for: indexPath) as! DishListableViewCell
        cell.setup(dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes [indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    
}
