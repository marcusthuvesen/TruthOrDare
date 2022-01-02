//
//  GameWindowView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit


class GameWindowView: UIViewController, GameWindowViewDelegate {
    
    @IBOutlet weak var infoBtnOutlet: UIButton!
    @IBOutlet weak var gameTextView: UITextView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    
    let gameWindowViewDelegate = GameWindowPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGameWindowDelegate()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    func setupGameWindowDelegate(){
        gameWindowViewDelegate.setGameWindowViewDelegate(gameWindowViewDelegate : self)
    }
    
    func setupUI() {
        infoBtnOutlet.infoOutlet_UI()
        gameTextView.centerText()
        categoryLabel.text = "Never have I ever...".localized()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sendToPopups()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        textViewHeightConstraint.constant = 250
    }
    
    func sendToPopups() {
        let numberOfTimesOpenedApp = UserDefaults.standard.integer(forKey: "NumberOfTimesOpenedApp")
        
        if numberOfTimesOpenedApp == 1 {
            sendToOnboardingView()
            //Bad solution but does the job of not showing onboarding several times in same session. Thus the number of times is always +1.
            UserDefaults.standard.set(numberOfTimesOpenedApp+1, forKey: "NumberOfTimesOpenedApp")
        }
    }
    
    func fetchAndSendToRateUsPopUp(){
        let fetchFromFB = FetchFromFirebase()
        fetchFromFB.fetchRateUsPopUpFlag(gameType : "none", completion: {showPopUp in (
            self.sendToRateUsPopup(show : showPopUp)
        )})
    }
    
    func sendToOnboardingView() {
        let sendToVC = UIStoryboard(name: "GameWindow", bundle: nil).instantiateViewController(withIdentifier: "OnboardingView") as! OnboardingView
        sendToVC.modalPresentationStyle = .overCurrentContext
        self.present(sendToVC, animated: true)
    }
    
    func sendToRateUsPopup(show : Bool) {
        let hasBeenShown = UserDefaults.standard.bool(forKey: "ShownRateUsPopUp")
        
        if show && !hasBeenShown && !GlobalVariables.hasFullAccess {
            presentPopup(UIStoryboardName: "RateUsPopUp", WithIdentifier: "RateUsPopUpView", VC: self)
            UserDefaults.standard.set(true, forKey: "ShownRateUsPopUp")
            let preferredLanguage = NSLocale.preferredLanguages[0]
            if preferredLanguage == "sv-SE" {
                GlobalVariables.gameTextArray += ProvideGameTexts().extraStatements_se
            } else {
                GlobalVariables.gameTextArray += ProvideGameTexts().extraStatements_en
            }
            
        }
    }
    
    func sendToPremiumPopup() {
        let sendToVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup") as! PremiumPopupView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    func sendToInfoPopup() {
        presentPopup(UIStoryboardName: "InfoPopup", WithIdentifier: "InfoPopup", VC: self)
    }
    
    func changeBackgroundColor(color : UIColor) {
        backgroundView.backgroundColor = color
    }
    
    
    func showCategoryLabel() {
        categoryLabel.isHidden = false
    }
    
    func hideCategoryLabel() {
        categoryLabel.isHidden = true
    }
    
    func setCategoryTextOnLabel(categoryText : String) {
        categoryLabel.text = categoryText
    }
    
    func animateTextLabel() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.2, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.2, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.06, y: 1.0 )
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.3, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    func changeStatementUI(statement : String) {
        gameTextView.text = statement
    }
    
    func showRulesIcon() {
        infoBtnOutlet.isHidden = false
    }
    
    func hideRulesIcon() {
        infoBtnOutlet.isHidden = true
    }
    
  
    
    @IBAction func infoBtnClicked(_ sender: UIButton) {
        gameWindowViewDelegate.infoBtnActions()
    }
    
    @IBAction func previousStatement(_ sender: UIButton) {
        gameWindowViewDelegate.previousStatement()
    }
    
    @IBAction func nextStatement(_ sender: UIButton) {
        gameWindowViewDelegate.nextStatement()
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
    
}


