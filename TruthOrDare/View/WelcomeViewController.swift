//
//  WelcomeViewController.swift
//  NeverHaveIEver
//
//  Created by Marcus Thuvesen on 2021-07-04.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var continueBtnOutlet: UIButton!
    @IBOutlet weak var premiumTopView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWelcomeUI()
        
    }
   
    
    func setupWelcomeUI() {
        continueBtnOutlet.layer.cornerRadius = continueBtnOutlet.frame.height / 2
        premiumTopView.topCutView_UI()
    }
    
    
    @IBAction func continueBtnClicked(_ sender: UIButton) {
        let sendToVC = UIStoryboard(name: "PayWall", bundle: nil).instantiateViewController(withIdentifier: "PayWallPopup") as! PayWallViewController
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
}
