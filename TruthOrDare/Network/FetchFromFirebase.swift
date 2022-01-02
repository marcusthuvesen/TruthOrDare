//
//  FetchFromFirebase.swift
//  RyggMotRygg
//
//  Created by Marcus Thuvesen on 2021-04-12.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation
import Firebase

struct FetchFromFirebase {
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    func pushData() {
//
//        ref.child("GameStatements").child("ExtraStatements_en").setValue(extraStatements_en)
//        ref.child("GameStatements").child("Tjejerna_en").setValue(tjejerna_en)
//        ref.child("GameStatements").child("Hot_en").setValue(hot_en)
//        ref.child("GameStatements").child("Grabbarna_en").setValue(grabbarna_en)
//        ref.child("GameStatements").child("Couples_en").setValue(couples_en)
////
//        ref.child("GameTexts").child("Standard_da").setValue(standard_da)
//        ref.child("GameTexts").child("ExtraStatements_da").setValue(extraStatements_da)
//        ref.child("GameTexts").child("Tjejerna_da").setValue(tjejerna_da)
//        ref.child("GameTexts").child("Snuskigt_da").setValue(snuskigt_da)
//        ref.child("GameTexts").child("Grabbarna_da").setValue(grabbarna_da)
//        ref.child("GameTexts").child("Extremt_da").setValue(extremt_da)
    }

    
    func fetchRateUsPopUpFlag(gameType : String, completion: @escaping (Bool)->Void) {
        var fetchedValue = false
        
        ref.child("AppFlags").child("ShouldPresentRateUsPopUp").observeSingleEvent(of: .value){ (snapshot, error) in
            if snapshot.exists() {
                fetchedValue = snapshot.value as? Bool ?? false
            }
            completion(fetchedValue)
        }
    }
    
    func fetchPayWallFlag(gameType : String, completion: @escaping (Bool)->Void) {
        var fetchedValue = false
        
        ref.child("AppFlags").child("ShouldPresentPayWall").observeSingleEvent(of: .value){ (snapshot, error) in
            if snapshot.exists() {
                fetchedValue = snapshot.value as? Bool ?? false
            }
            completion(fetchedValue)
        }
    }
    
    
    func fetchGameTexts(gameType : String, completion: @escaping ([String])->Void) {
        var fetchedArray = [String]()
        
        ref.child("GameTexts").child(gameType).observeSingleEvent(of: .value){ (snapshot, error) in
            if snapshot.exists() {
                     fetchedArray = snapshot.value as? [String] ?? []
            }
            completion(fetchedArray)
        }
        
    }
    
    
    
}
