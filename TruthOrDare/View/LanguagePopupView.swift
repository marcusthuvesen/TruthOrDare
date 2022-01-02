//
//  LanguagePopupView.swift
//  NeverHaveIEver
//
//  Created by Marcus Thuvesen on 2021-07-06.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import UIKit

class LanguagePopupView: UIViewController, LanguagePopupDelegate {
   
    
    @IBOutlet weak var languageContainerView: UIView!
    @IBOutlet weak var englishBtnOutlet: UIButton!
    @IBOutlet weak var swedishBtnOutlet: UIButton!
    
    
    let languagePopupDelegate = LanguagePopupPresenter()
    let homeDecisionViewDelegate = HomeDecisionPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanguagePopupDelegate()
        languagePopupUI()
    }
    
    private func languagePopupUI() {
        languageContainerView.layer.cornerRadius = 20
        englishBtnOutlet.layer.cornerRadius = 20
        swedishBtnOutlet.layer.cornerRadius = 20
        englishBtnOutlet.layer.borderWidth = 2
        englishBtnOutlet.layer.borderColor = UIColor.white.cgColor
        swedishBtnOutlet.layer.borderWidth = 2
        swedishBtnOutlet.layer.borderColor = UIColor.white.cgColor
    }
    
    func setCurrentLanguageUI(language: String) {
        switch language {
        case languagePopupDelegate.english:
            englishBtnOutlet.backgroundColor = .white
            englishBtnOutlet.setTitleColor(.black, for: .normal)
            swedishBtnOutlet.backgroundColor = .customBlue
            swedishBtnOutlet.setTitleColor(.white, for: .normal)
        case languagePopupDelegate.swedish:
            swedishBtnOutlet.backgroundColor = .white
            swedishBtnOutlet.setTitleColor(.black, for: .normal)
            englishBtnOutlet.backgroundColor = .customBlue
            englishBtnOutlet.setTitleColor(.white, for: .normal)
        default:
            englishBtnOutlet.backgroundColor = .white
        }
    }
    
    func setupLanguagePopupDelegate(){
        languagePopupDelegate.setLanguagePopupDelegate(languagePopupDelegate : self)
    }
    
    @IBAction func languageBtnClicked(_ sender: UIButton) {
        
        languagePopupDelegate.sendSelectedLanguageToHomeView(senderTag: sender.tag)
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func closePopupBtnClicked(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        
    }
    
}
