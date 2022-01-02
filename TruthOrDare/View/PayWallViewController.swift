//
//  PayWallViewController.swift
//  NeverHaveIEver
//
//  Created by Marcus Thuvesen on 2021-07-04.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PayWallViewController: UIViewController {
    
    
    @IBOutlet weak var premiumBtnOutlet: UIButton!
    @IBOutlet weak var premiumTopView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPayWallUI()
    }
    
    
    func setupPayWallUI() {
        premiumTopView.topCutView_UI()
        premiumBtnOutlet.layer.cornerRadius = premiumBtnOutlet.frame.height / 2
    }

    
    @IBAction func premiumBtnClicked(_ sender: UIButton) {
        IAPService.shared.purchase(product: .fullAccess)
    }
    
    @IBAction func dismissBtnClicked(_ sender: UIButton) {
        let sendToVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeDecisionView") as! HomeDecisionView
        sendToVC.modalPresentationStyle = .fullScreen
        self.present(sendToVC, animated: true)
    }
    
}
