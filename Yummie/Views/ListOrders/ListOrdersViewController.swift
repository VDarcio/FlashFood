//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by VD on 05/09/2021.
//

import UIKit

class ListOrdersViewController: UIViewController {

    var orders : [Order] = [
        .init(id: "id1", name: "pao c bolacha", dish: .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 34, image: "https://picsum.photos/100/200")),
        .init(id: "id1", name: "pao c bolacha", dish: .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 34, image: "https://picsum.photos/100/200")),
        .init(id: "id1", name: "pao c bolacha", dish: .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 34, image: "https://picsum.photos/100/200"))
            
    
    
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
registerCells()
        title = "Orders"
    
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
