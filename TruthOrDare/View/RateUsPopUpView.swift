//
//  RateUsPopUpView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2021-03-31.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit
import StoreKit
import FirebaseAnalytics

class RateUsPopUpView: UIViewController {
    
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var sendFeedbackOutlet: UIButton!
    @IBOutlet weak var dismissOutlet: UIButton!
    @IBOutlet weak var rateUsTextView: UITextView!
    @IBOutlet weak var rateUsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopupUI()
    }
    
    
    func setupPopupUI() {
        popupView.layer.cornerRadius = 25
        sendFeedbackOutlet.layer.cornerRadius = sendFeedbackOutlet.frame.height / 2
        dismissOutlet.layer.cornerRadius = dismissOutlet.frame.height / 2
        rateUsTextView.text = "Rate us 5 stars and unlock more statements.".localized()
        dismissOutlet.setTitle("Not now".localized(), for: .normal)
        sendFeedbackOutlet.setTitle("Yes!".localized(), for: .normal)
        rateUsLabel.text = "Free Statements? 😍".localized()
    }
    
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        Analytics.logEvent("Pressed Close Popup", parameters: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendFeedbackClicked(_ sender: UIButton) {
        Analytics.logEvent("Pressed Rate App", parameters: nil)
        SKStoreReviewController.requestReview()
        dismiss(animated: true, completion: nil)
    }
    
    
    
}


