//
//  CreditCardsViewController.swift
//  FlashFood
//
//  Created by VD on 17/10/2021.
//

import UIKit
import AnimatedCardInput
import RealmSwift

class CreditCardsViewController: UIViewController {
    
    let realm = try! Realm()
    var cards : Results<CCard>?

    private let cardView: CardVieww = {
        let view = CardVieww(
            cardNumberDigitsLimit: 16,
            cardNumberChunkLengths: [4, 4, 4, 4],
            CVVNumberDigitsLimit: 3
        )

        view.frontSideCardColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        view.backSideCardColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        view.selectionIndicatorColor = .orange
        view.frontSideTextColor = .white
        view.CVVBackgroundColor = .white
        view.backSideTextColor = .black
        view.isSecureInput = true

        view.numberInputFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
        view.nameInputFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.validityInputFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.CVVInputFont = UIFont.systemFont(ofSize: 20, weight: .semibold)

        return view
    }()
    
    private let inputsView: CardInputsView = {
        let view = CardInputsView(cardNumberDigitLimit: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureInput = true
        return view
    }()

    private let retrieveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Add Card ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(retrieveTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.creditCardDataDelegate = inputsView
        inputsView.creditCardDataDelegate = cardView

        [
            cardView,
            inputsView,
            retrieveButton,
        ].forEach(view.addSubview)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            inputsView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 24),
            inputsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inputsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            retrieveButton.heightAnchor.constraint(equalToConstant: 44),
            retrieveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retrieveButton.topAnchor.constraint(equalTo: inputsView.bottomAnchor, constant: 24),

        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardView.currentInput = .cardNumber
    }

    @objc private func retrieveTapped() {
        let data = cardView.creditCardData
        //save the card to Realm DataBase
        let newCard = CCard()
        newCard.cardHolderName = data.cardholderName
        newCard.cardNumber = data.cardNumber
        newCard.cardValidity = data.validityDate
        newCard.CVVnumber = data.CVVNumber
        
        self.saveNewCard(newCard)
        self.dismiss(animated: true, completion: nil)
        
//        """
//        \(data.cardProvider?.name ?? String())
//        \(data.cardNumber)
//        \(data.cardholderName)
//        \(data.validityDate)
//        \(data.CVVNumber)
//        """
    }
    
    func saveNewCard(_ Card: CCard){
        
        
            try! realm.write({
                realm.add(Card)
            })
        
        
    }
    
    
    
    

}
