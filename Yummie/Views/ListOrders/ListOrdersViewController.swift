//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by VD on 05/09/2021.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    var orders : [Order] = [
        
            
    
    
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
registerCells()
        title = "Orders"
        ProgressHUD.show()
        
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self]result in
            switch result{
            
        
            case .success(let ordersfetched):
                self?.orders = ordersfetched
                self?.tableView.reloadData()
                ProgressHUD.dismiss()
                
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListableViewCell.identifier)
    }
  

}

extension ListOrdersViewController :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListableViewCell.identifier, for: indexPath) as! DishListableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
   
    }
    
    
    
    
    
    
    
    
  
    
    
    
}
