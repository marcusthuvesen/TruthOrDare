//
//  AppDelegate.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-04.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import StoreKit
import SwiftyStoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.isIdleTimerDisabled = true
        
        IAPService.shared.getProducts()
        CheckPurchase.shared.checkUserPurchase()
        // see notes below for the meaning of Atomic / Non-Atomic
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                // Unlock content
                case .failed, .purchasing, .deferred:
                break // do nothing
                @unknown default:
                    print("Unknown Error")
                }
            }
        }
        FirebaseApp.configure()
        howManyTimesOpenedApp()
        return true
    }
    
    func howManyTimesOpenedApp() {
        let numberOfTimes = UserDefaults.standard.integer(forKey: "NumberOfTimesOpenedApp")
        UserDefaults.standard.set(numberOfTimes+1, forKey: "NumberOfTimesOpenedApp")
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .all
    }
 
    
    
}


