//
//  HomeDecisionView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeDecisionView: UIViewController, HomeDecisionViewDelegate, LanguagePopupDelegate {
    
    
    func setCurrentLanguageUI(language: String) {
        
    }
    
    @IBOutlet var decisionBtnOutlets: [UIButton]!
    @IBOutlet var buttonViews: [UIView]!
    @IBOutlet weak var rightLockStackView: UIStackView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var drinksImg: UIImageView!
    @IBOutlet weak var spicyImg: UIImageView!
    @IBOutlet weak var standardLabel: UILabel!
    @IBOutlet weak var boysLabel: UILabel!
    @IBOutlet weak var girlsLabel: UILabel!
    @IBOutlet weak var dirtyLabel: UILabel!
    @IBOutlet weak var couplesLabel: UILabel!
    @IBOutlet weak var standardTextView: UITextView!
    @IBOutlet weak var boysTextView: UITextView!
    @IBOutlet weak var girlsTextView: UITextView!
    @IBOutlet weak var dirtyTextView: UITextView!
    @IBOutlet weak var couplesTextView: UITextView!
    @IBOutlet weak var emitterView: UIView!
    @IBOutlet weak var languageBtnOutlet: UIButton!
    
    let homeDecisionViewDelegate = HomeDecisionPresenter()
    let languageViewDelegate = LanguagePopupPresenter()
    let fetchFromFB = FetchFromFirebase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeDecisionDelegate()
        setupHomeDecisionUI()
        changeUIBasedOnDevice()
        //FetchFromFirebase().pushData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndPresentPayWallIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        homeDecisionViewDelegate.checkIfPaidUserToChangeUI()
        
    }
    
    func setLanguageImage(image: UIImage) {
        languageBtnOutlet.setImage(image, for: .normal)
    }
    
    func fetchAndPresentPayWallIfNeeded(){
        fetchFromFB.fetchPayWallFlag(gameType : "none", completion: {showPopUp in (
            self.analyzePayWallPresentation(show : showPopUp)
        )})
    }
    
    func analyzePayWallPresentation(show : Bool) {
        let shouldPresentPaywall = UserDefaults.standard.bool(forKey: "shouldPresentPaywall")
        if  show && shouldPresentPaywall && !GlobalVariables.hasFullAccess {
            presentPayWall()
            UserDefaults.standard.set(false, forKey: "shouldPresentPaywall")
        }
    }
    
    func presentPayWall() {
        
        let sendToVC = UIStoryboard(name: "PayWall", bundle: nil).instantiateViewController(withIdentifier: "WelcomePopup") as! WelcomeViewController
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }
    
//    
//    func setCurrentLanguageImage(language : String) {
//        
//        switch language {
//        case self.languageViewDelegate.english:
//            languageBtnOutlet.setImage(UIImage(named: "english"), for: .normal)
//        case self.languageViewDelegate.swedish:
//            languageBtnOutlet.setImage(UIImage(named: "swedish"), for: .normal)
//        default:
//            languageBtnOutlet.setImage(UIImage(named: "english"), for: .normal)
//        }
//    }
    
    func setupHomeDecisionUI() {
        //homeDecisionViewDelegate.setLanguageImageOnFirstOpen()
        for button in decisionBtnOutlets {
            button.homeDecisionOutlet_UI()
        }
        for view in buttonViews {
            view.homeDecisionView_UI()
        }
        categoryLabel.text = "Modes".localized()
        standardLabel.text = "Pre party".localized()
        boysLabel.text     = "Boys".localized()
        girlsLabel.text    = "Girls".localized()
        dirtyLabel.text    = "Dirty".localized()
        couplesLabel.text  = "Couples".localized()
        
        standardTextView.text = "Get the party started".localized()
        boysTextView.text     = "Statements for the boys!".localized()
        girlsTextView.text    = "Perfect for girls night".localized()
        dirtyTextView.text    = "WOW! Is it hot in here?".localized()
        couplesTextView.text  = "Get to know each other for real!".localized()
        setupGradientLayer()
        createParticles()
        
    }
    
    func setupGradientLayer(){
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.customBlue.cgColor, UIColor.premiumPurple.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func createParticles() {
        
        let emitter = Emitter.get(with: UIImage(named: "bubble2")!)
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: view.frame.height)
        emitter.emitterSize = CGSize(width: view.frame.width, height: view.frame.height)
        emitterView.layer.addSublayer(emitter)
    }
    
    
    func changeToPremiumView() {
        rightLockStackView.isHidden = true
        drinksImg.alpha = 1
        spicyImg.alpha = 1
    }
    
    func changeUIBasedOnDevice() {
        let deviceType = UIDevice.modelName
        
        if deviceType.contains("iPad") {
            changeUIForIpad()
        }
    }
    
    func changeUIForIpad() {
        for button in decisionBtnOutlets{
            button.titleLabel?.font =  UIFont(name: "AvenirNext-DemiBold", size: 35)
            button.titleEdgeInsets.left = -300
        }
        
    }
    
    func sendToGameWindow() {
        let sendToVC = UIStoryboard(name: "GameWindow", bundle: nil).instantiateViewController(withIdentifier: "GameWindow") as! GameWindowView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    func sendToPremiumPopup() {
        presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    
    @IBAction func decisionBtnClicked(_ sender: UIButton) {
        homeDecisionViewDelegate.decisionBtnSelected(senderTag: sender.tag)
    }
    
    @IBAction func settingsBtnClicked(_ sender: UIButton) {
        
        presentPopup(UIStoryboardName: "SettingsPopup", WithIdentifier: "SettingsPopup", VC: self)
    }
    
    
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.view.layer.sublayers?.first?.frame = self.view.bounds
    }
    
    @IBAction func languageBtnClicked(_ sender: UIButton) {
        presentPopup(UIStoryboardName: "LanguagePopup", WithIdentifier: "LanguagePopup", VC: self)
    }
    
}

