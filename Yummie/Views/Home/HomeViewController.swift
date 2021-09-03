//
//  HomeViewController.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionjView: UICollectionView!
    @IBOutlet weak var PopularCollectionVieww: UICollectionView!
    
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "comida do darcio", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "comida do vf", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "comida do darciohfgf", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "comida do 34634634", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "comida do jkol;", image: "https://picsum.photos/100/200")
        
    ]
    
    var populars :[Dish] = [
        .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 34, image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 90, image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 76, image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "qualquer coisa", description: "mto bom", calories: 45, image: "https://picsum.photos/100/200")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    
    private func registerCells(){
        categoryCollectionjView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        PopularCollectionVieww.register(UINib(nibName: DishPortraitCollectionViewCell.indentifier, bundle: nil), forCellWithReuseIdentifier: "DishPortraitCollectionViewCell")
    }
    

    

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionjView :
            return categories.count
        case PopularCollectionVieww:
            return populars.count
        default : return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch collectionView{
        case categoryCollectionjView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case PopularCollectionVieww:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.indentifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(populars[indexPath.row])
            
            return cell
            
            
            
        default : return UICollectionViewCell()
        }
        
        
        
        
        
        
    }

}
