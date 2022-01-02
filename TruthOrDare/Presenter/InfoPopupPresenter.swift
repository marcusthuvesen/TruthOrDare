//
//  InfoPopupPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-23.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol InfoPopupViewDelegate : NSObjectProtocol{
    //func decisionBtnSelected(sender : UIButton)
    //func setRulesTextToTextView(rulesText : String)
    func setRulesLabelTextToLabel(rulesLabelText : String)
    func setRulesImageToUI(rulesImgString : String)
}

class InfoPopupPresenter {
    weak private var infoPopupViewDelegate : InfoPopupViewDelegate?
    let provideGameTexts = ProvideGameTexts()
    
    func setInfoPopupViewDelegate(infoPopupViewDelegate : InfoPopupViewDelegate){
        self.infoPopupViewDelegate = infoPopupViewDelegate
        setupRulesText()
    }
    
    func setupRulesText() {
 
    }
}
