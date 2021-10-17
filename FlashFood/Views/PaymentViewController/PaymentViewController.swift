//
//  PaymentViewController.swift
//  FlashFood
//
//  Created by VD on 16/10/2021.
//

import UIKit
import RealmSwift

class PaymentViewController: UIViewController {
    
    let realm = try! Realm()
    var cards : Results<CCard>?
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCards()
        tableview.reloadData()
    }
    
    @IBAction func newCardPressed(_ sender: UIButton) {
        let cardsvc = CreditCardsViewController.instantiate()
        cardsvc.modalTransitionStyle = .coverVertical
        cardsvc.modalPresentationStyle = .fullScreen
        present(cardsvc, animated: true, completion: nil)
    }
    

}

//MARK:-tableviewdata

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cards?.count ?? 1
        }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCell", for: indexPath)
        if cards == nil{
            cell.textLabel?.text = "No cards available"
        }
            let cardnumbers = cards?[indexPath.row].cardNumber
            let lastNumbers = cardnumbers?.suffix(4)
        cell.textLabel?.text = "Card ending with.. \(lastNumbers ?? "")"
            cell.detailTextLabel?.text = cards?[indexPath.row].cardHolderName ?? ""
        return cell
        }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, handler in
            
            let cardtoRemove = self.cards![indexPath.row]
            
            do{
                try self.realm.write({
                    self.realm.delete(cardtoRemove)
                })
            }catch{
                print(error)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DishDetailViewController.placeOrder(DishDetailViewController.dishID, DishDetailViewController.buyerName)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func loadCards(){
        cards = realm.objects(CCard.self)
        
        
    }
    
}


