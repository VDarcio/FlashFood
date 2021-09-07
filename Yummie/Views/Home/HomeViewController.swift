//
//  HomeViewController.swift
//  Yummie
//
//  Created by VD on 03/09/2021.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionjView: UICollectionView!
    @IBOutlet weak var PopularCollectionVieww: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
        
    ]
    
    var populars :[Dish] = [
       
        
    ]
    
    var  specials : [Dish] = [
        
       
    
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result{
            
            case .success(let allDishes):
                print("sucessoooo")
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                self?.categoryCollectionjView.reloadData()
                self?.PopularCollectionVieww.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
            print(error.localizedDescription)
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCells(){
        categoryCollectionjView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        PopularCollectionVieww.register(UINib(nibName: DishPortraitCollectionViewCell.indentifier, bundle: nil), forCellWithReuseIdentifier: "DishPortraitCollectionViewCell")
        specialsCollectionView.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier:DishLandScapeCollectionViewCell.identifier)
    
    }
    

    

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionjView :
            return categories.count
        case PopularCollectionVieww:
            return populars.count
        case specialsCollectionView :
            return specials.count
            
        default : return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // switch case to decide wich section to load
        switch collectionView{
        case categoryCollectionjView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
            
        case PopularCollectionVieww:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.indentifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(populars[indexPath.row])
            
            return cell
            
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for: indexPath) as! DishLandScapeCollectionViewCell
            cell.setup(specials[indexPath.row])
           
            return cell
            
            
        default : return UICollectionViewCell()
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == categoryCollectionjView{
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == PopularCollectionVieww ? populars[indexPath.row] : specials [indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }

}
