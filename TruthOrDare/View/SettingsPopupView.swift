
//  SettingsPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-29.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

class SettingsPopupView: UIViewController, SettingsPopupViewDelegate{
    
    @IBOutlet var settingsOutlets: [UIButton]!
    @IBOutlet weak var settingsBgView: UIView!
    
    
    let settingsPopupViewDelegate = SettingsPopupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettings_UI()
        setupSettingsPopupDelegate()
    }
    
    func setupSettings_UI() {
        for button in settingsOutlets {
            button.layer.cornerRadius = 25
            button.backgroundColor = .customGreen
        }
        settingsOutlets[0].setTitle("Terms & Conditions".localized(), for: .normal)
        settingsOutlets[1].setTitle("Privacy Policy".localized(), for: .normal)
        settingsOutlets[2].setTitle("Restore Purchase".localized(), for: .normal)
        settingsOutlets[3].setTitle("Buy Premium".localized(), for: .normal)
        
        
        settingsBgView.infoBackgroundView_UI()
    }
    
    func setupSettingsPopupDelegate() {
        settingsPopupViewDelegate.setSettingsPopupViewDelegate(settingsPopupViewDelegate : self)
    }
    
    func presentAlertPopup() {
        // create the alert
        let alert = UIAlertController(title: "Restored".localized(), message: "We have now restored your purchases to this device".localized(), preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Okey".localized(), style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentPremiumPopup() {
        let sendToVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup") as! PremiumPopupView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
        //presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    
    func presentTermsAndConditions() {
        openUrl(urlStr: "https://backs.flycricket.io/terms.html")
    }
    
    func presentPrivacyPolicy() {
        openUrl(urlStr: "https://backs.flycricket.io/privacy.html")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    
    @IBAction func settingsBtnAction(_ sender: UIButton) {
        settingsPopupViewDelegate.settingsBtnActions(senderTag: sender.tag)
    }
    
    @IBAction func dismissPopupBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
