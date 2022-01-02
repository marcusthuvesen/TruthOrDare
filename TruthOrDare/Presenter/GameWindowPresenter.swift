//
//  GameWindowPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-13.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAnalytics

protocol GameWindowViewDelegate : NSObjectProtocol{
    func changeStatementUI(statement : String)
    func sendToPremiumPopup()
    func sendToInfoPopup()
    func changeBackgroundColor(color : UIColor)
    func showCategoryLabel()
    func hideCategoryLabel()
    func setCategoryTextOnLabel(categoryText : String)
    func hideRulesIcon()
    func animateTextLabel()
    func fetchAndSendToRateUsPopUp()
}

class GameWindowPresenter {
    
    weak private var gameWindowViewDelegate : GameWindowViewDelegate?
    var counter = 0
    let gameTextArray = GlobalVariables.gameTextArray
    
    
    func setGameWindowViewDelegate(gameWindowViewDelegate : GameWindowViewDelegate){
        self.gameWindowViewDelegate = gameWindowViewDelegate
        setupStatementArray()
        
    }

    func infoBtnActions() {
        self.gameWindowViewDelegate?.sendToInfoPopup()
    }
  
    func setCategoryColor(currentGame : String) {
        var backgroundColor = UIColor.customGreen
        
        if currentGame == "Standard" { backgroundColor = .customBlue}
        if currentGame == "Grabbarna" { backgroundColor = .customGreen}
        if currentGame == "Tjejerna" { backgroundColor = .premiumPurple}
        if currentGame == "Hot" { backgroundColor = .customPink}
        if currentGame == "Couples" { backgroundColor = .customRed}
        
        self.gameWindowViewDelegate?.changeBackgroundColor(color: backgroundColor)
    }
   
    
    func setupStatementArray() {
        setCategoryText(text : gameTextArray[counter])
        setCategoryColor(currentGame : GlobalVariables.currentGameKey)
        self.gameWindowViewDelegate?.changeStatementUI(statement : gameTextArray[counter])
    }
   
    func previousStatement() {
        if counter != 0 {
            counter -= 1
            setCategoryText(text : gameTextArray[counter])
            self.gameWindowViewDelegate?.changeStatementUI(statement : GlobalVariables.gameTextArray[counter])
        }
    }
    
    func nextStatement() {
       
        if counter == 10 { self.gameWindowViewDelegate?.fetchAndSendToRateUsPopUp() }
        
        if counter < GlobalVariables.gameTextArray.count - 1 {
            counter += 1
            //If statement is same as in any of the arrays set pre defined category
            setCategoryText(text : GlobalVariables.gameTextArray[counter])
            self.gameWindowViewDelegate?.changeStatementUI(statement : GlobalVariables.gameTextArray[counter])
        } else {
            counter = 0
        }
    }

    
    func setCategoryText(text : String) {
        self.gameWindowViewDelegate?.animateTextLabel()
    }
}
