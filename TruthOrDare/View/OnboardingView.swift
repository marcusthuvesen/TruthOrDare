//
//  OnboardingView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-08-07.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class OnboardingView: UIViewController {

    @IBOutlet weak var okayOutlet: UIButton!
    @IBOutlet weak var previousTextView: UITextView!
    @IBOutlet weak var nextTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardingUI()
    }
    
    func onBoardingUI() {
        okayOutlet.layer.cornerRadius = okayOutlet.frame.height/2
        okayOutlet.layer.masksToBounds = true
        okayOutlet.layer.borderWidth = 2
        okayOutlet.layer.borderColor = UIColor.white.cgColor
        previousTextView.text = "Previous Statement".localized()
        nextTextView.text = "Next Statement".localized()
        okayOutlet.setTitle("Okey".localized(), for: .normal)
    }
    
    @IBAction func okayBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
