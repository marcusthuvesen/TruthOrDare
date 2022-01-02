//
//  Localization_Extension.swift
//  RyggMotRygg
//
//  Created by Marcus Thuvesen on 2021-05-05.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation

extension String {
    
    func localized() -> String {
        
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
        
    }
    
    
}
