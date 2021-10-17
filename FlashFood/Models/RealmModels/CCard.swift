//
//  CCard.swift
//  FlashFood
//
//  Created by VD on 17/10/2021.
//

import Foundation
import RealmSwift

class CCard: Object{
    @objc dynamic var cardNumber : String = ""
    @objc dynamic var cardHolderName : String = ""
    @objc dynamic var cardValidity : String = ""
    @objc dynamic var CVVnumber : String = ""
}
