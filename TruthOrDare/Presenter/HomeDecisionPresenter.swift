
import Foundation
import UIKit
import FirebaseAnalytics

protocol HomeDecisionViewDelegate : NSObjectProtocol{
    func sendToGameWindow()
    func sendToPremiumPopup()
    func changeToPremiumView()
   // func setCurrentLanguageImage(language : String)
   // func setLanguageImage(image : UIImage)
}


class HomeDecisionPresenter {
    public static var homeDecisionViewDelegate : HomeDecisionViewDelegate?
    static let provideGameTexts = ProvideGameTexts()
    
    func setHomeDecisionViewDelegate(homeDecisionViewDelegate : HomeDecisionViewDelegate) {
        HomeDecisionPresenter.homeDecisionViewDelegate = homeDecisionViewDelegate
        checkIfPaidUserToChangeUI()
        
       // FetchFromFirebase().pushData()
        fetchGameTexts()
        //setLanguageImage(language: fetchCurrentLanguage())
    }
    
//    func fetchCurrentLanguage() -> String{
//        guard let language = UserDefaults.standard.string(forKey: "LANGUAGE") else { return "en" }
//        return language
//    }
//
//    func setLanguageImage(language : String) {
//        HomeDecisionPresenter.homeDecisionViewDelegate?.setCurrentLanguageImage(language : language)
//    }
//
//    func setLanguageImageOnFirstOpen() {
//
//        let numberOfTimes = UserDefaults.standard.integer(forKey: "NumberOfTimesOpenedApp")
//
//        if numberOfTimes <= 1 {
//            switch GlobalVariables.preferredLanguage {
//            case "en":
//                HomeDecisionPresenter.homeDecisionViewDelegate?.setLanguageImage(image: UIImage(named: "english")!)
//            case "sv-SE":
//                HomeDecisionPresenter.homeDecisionViewDelegate?.setLanguageImage(image: UIImage(named: "swedish")!)
//            default:
//                HomeDecisionPresenter.homeDecisionViewDelegate?.setLanguageImage(image: UIImage(named: "english")!)
//            }
//        }
//
//    }
    
    private func fetchGameTexts() {
        HomeDecisionPresenter.provideGameTexts.fetchFromFB()
    }
    
    
    func checkIfPaidUserToChangeUI() {
        if GlobalVariables.hasFullAccess {
            HomeDecisionPresenter.homeDecisionViewDelegate?.changeToPremiumView()
        }
    }
    
    func decisionBtnSelected(senderTag : Int) {
        
        switch senderTag {
        case 0:
            fetch_Standard()
        case 1:
            fetch_Grabbarna()
        case 2:
            fetch_Tjejerna()
        case 3:
            fetch_hot()
        case 4:
            fetch_Extremt()
        default:
            fetch_Standard()
        }
    }
    
    func fetch_Standard() {
       
        GlobalVariables.currentGameKey = "Standard"
        HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Standard")
        GlobalVariables.gameTextArray.shuffle()
        HomeDecisionPresenter.homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Grabbarna() {
        
        GlobalVariables.currentGameKey = "Grabbarna"
        if GlobalVariables.hasFullAccess {
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToPremiumPopup()
        } else {
            HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Grabbarna")
            GlobalVariables.gameTextArray.shuffle()
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_Tjejerna() {
       
        GlobalVariables.currentGameKey = "Tjejerna"
        if GlobalVariables.hasFullAccess {
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToPremiumPopup()
        } else {
            HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Tjejerna")
            GlobalVariables.gameTextArray.shuffle()
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_hot() {
        
        GlobalVariables.currentGameKey = "Hot"
        if GlobalVariables.hasFullAccess {
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToPremiumPopup()
        } else {
            HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Hot")
            GlobalVariables.gameTextArray.shuffle()
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_Extremt() {

        GlobalVariables.currentGameKey = "Couples"
        if !GlobalVariables.hasFullAccess {
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToPremiumPopup()
        } else {
            HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Couples")
            GlobalVariables.gameTextArray.shuffle()
            HomeDecisionPresenter.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
}



