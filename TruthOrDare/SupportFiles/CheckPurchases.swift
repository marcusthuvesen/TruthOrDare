//
//  CheckPurchases.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-06-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import TPInAppReceipt
import SwiftyStoreKit


class CheckPurchase{
    static let shared = CheckPurchase()
    
   
    func checkUserPurchase() {
        GlobalVariables.hasFullAccess = false
        GlobalVariables.partialAccessArrayKeys.removeAll()
        do {

            let receipt = try InAppReceipt.localReceipt()

            let fullAccessPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.fullAccess.rawValue)
            //print("fullaccesspurchasecount = \(fullAccessPurchase.count)")
            if fullAccessPurchase.count != 0{
                GlobalVariables.hasFullAccess = true
                print("Has purchase \(fullAccessPurchase)")
            } else {
                GlobalVariables.hasFullAccess = false
            }
        } catch {
            print("no Purhase \(error)")

        }
    }
    
}
