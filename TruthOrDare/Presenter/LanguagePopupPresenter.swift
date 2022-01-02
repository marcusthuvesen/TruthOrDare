//
//  LanguagePopupPresenter.swift
//  NeverHaveIEver
//
//  Created by Marcus Thuvesen on 2021-07-10.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation


protocol LanguagePopupDelegate : NSObjectProtocol{
    func setCurrentLanguageUI(language : String)
}

class LanguagePopupPresenter {
    weak private var languagePopupDelegate : LanguagePopupDelegate?
    weak private var homeDecisionDelegate : HomeDecisionViewDelegate?
    let english = "en"
    let swedish = "se"
    
    func setLanguagePopupDelegate(languagePopupDelegate : LanguagePopupDelegate){
        self.languagePopupDelegate = languagePopupDelegate
        self.languagePopupDelegate?.setCurrentLanguageUI(language: fetchCurrentLanguage())
    }
    
    func fetchCurrentLanguage() -> String {
        guard let language = UserDefaults.standard.string(forKey: "LANGUAGE") else { return "en" }
        print(language)
        return language
    }
    

    func sendSelectedLanguageToHomeView(senderTag : Int) {
//        
//        if senderTag == 0 {
//            HomeDecisionPresenter.homeDecisionViewDelegate?.setCurrentLanguageImage(language: english)
//            UserDefaults.standard.set(english, forKey: "LANGUAGE")
//            
//        } else {
//            HomeDecisionPresenter.homeDecisionViewDelegate?.setCurrentLanguageImage(language: swedish)
//            UserDefaults.standard.set(swedish, forKey: "LANGUAGE")
//        }
    }
    
}
