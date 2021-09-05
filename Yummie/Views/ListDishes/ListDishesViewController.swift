//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by VD on 05/09/2021.
//

import UIKit

class ListDishesViewController: UIViewController {

   
    @IBOutlet weak var TableView: UITableView!
    var category : DishCategory!
    
    var dishes : [Dish] = [.init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 34, image: "https://picsum.photos/100/200"),
                           .init(id: "id1", name: "qualquer coisa", description: "mto dkgsdfghk", calories: 90, image: "https://picsum.photos/100/200"),
                           .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 76, image: "https://picsum.photos/100/200"),
                           .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 45, image: "https://picsum.photos/100/200")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registercells()
        
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
