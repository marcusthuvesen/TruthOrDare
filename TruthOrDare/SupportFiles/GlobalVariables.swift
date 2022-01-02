//
//  GlobalVariables.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-13.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation

struct GlobalVariables {
    public enum GameType {
        case Standard, Grabbarna, Tjejerna, Snuskigt, Extremt
    }
    public static var gameTextArray = [""]
    public static var partialAccessArrayKeys = [""]
    public static var hasFullAccess = false
    public static var currentGameKey = ""
    public static var preferredLanguage = NSLocale.preferredLanguages.first ?? "en"
    
    
}

