//
//  PremiumPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-14.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopupView: UIViewController, PremiumPopupViewDelegate{
    
    @IBOutlet weak var continueToPaymentOutlet: UIButton!
    @IBOutlet weak var premiumPopupView: UIView!
    @IBOutlet weak var dismissOutlet: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var redeemPurchaseOutlet: UIButton!
    @IBOutlet weak var privacyPolicyOutlet: UIButton!
    @IBOutlet weak var termsOutlet: UIButton!
    @IBOutlet weak var premiumTopView: UIView!
    @IBOutlet weak var continueToPaymentView: UIView!
    @IBOutlet weak var freeTrialLabel: UILabel!
    @IBOutlet weak var trialInfoLabel: UILabel!
    @IBOutlet weak var premiumInfoTextView: UITextView!
    
    let premiumPopupViewDelegate = PremiumPopupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPopupUI()
        setupPremiumPopupDelegate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       animatePaymentView()
    }
    
    func setupPremiumPopupDelegate() {
        premiumPopupViewDelegate.setPremiumPopupViewDelegate(premiumPopupViewDelegate : self)
    }
    
    func setupPopupUI() {
        continueToPaymentView.premiumContinueView_UI()
        premiumTopView.topCutView_UI()
        topLabel.text = "Unlock ALL categories".localized()
        middleLabel.text = "Hundreds of awesome statements".localized()
        bottomLabel.text = "Weekly updates & improvements".localized()
        redeemPurchaseOutlet.setTitle("Restore Purchase".localized(), for: .normal)
        privacyPolicyOutlet.setTitle("Privacy Policy".localized(), for: .normal)
        termsOutlet.setTitle("Terms & Conditions".localized(), for: .normal)
        freeTrialLabel.text = "FREE TRIAL".localized()
        trialInfoLabel.text = "Free for 3 days then $4.99 per week".localized()
        premiumInfoTextView.text = "Premium version offers weekly subscription for $4.99 after 3-days free trial. Payment will be charged to Itunes Account at confirmation of purchase. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period at the cost of the chosen package. Subscription can be managed by the user. It can be turned off by going to the Appstore account settings.".localized()
    }
    
    func animatePaymentView() {
        
        UIView.animate(withDuration: 0.65,
                           delay: 0,
                           options: [ .repeat, .autoreverse],
                           animations: {
                            self.continueToPaymentView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }, completion: nil)
    }
    
    func presentTermsAndConditions() {
        openUrl(urlStr: "https://backs.flycricket.io/terms.html.")
    }
    
    func presentPrivacyPolicy() {
        openUrl(urlStr: "https://backs.flycricket.io/privacy.html")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func termsConditionsClicked(_ sender: Any) {
        presentTermsAndConditions()
    }
    
    @IBAction func privacyPolicyClicked(_ sender: Any) {
        presentPrivacyPolicy()
    }
    
    @IBAction func restorePurchasesClicked(_ sender: Any) {
        IAPService.shared.restorePurchases()
        presentAlertPopup()
    }
    
    func presentAlertPopup() {
        let alert = UIAlertController(title: "Restored", message: "We have now restored your purchases to this device", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func fullAccessClicked(_ sender: UIButton) {
        premiumPopupViewDelegate.fullAccessClickedActions()
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
