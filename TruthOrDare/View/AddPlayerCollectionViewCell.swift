//
//  AddPlayerCollectionViewCell.swift
//  TruthOrDare
//
//  Created by Marcus Thuvesen on 2021-12-22.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol CellDelegate: NSObjectProtocol {
    func updateTextInArray(text : String, index : Int)
    func removePlayer(sender: AnyObject?)
}

class AddPlayerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    public static var cellDelegate : CellDelegate?
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
        
        nameTextField.textAlignment = .center
        nameTextField.borderStyle = .none
        nameTextField.textColor = .white
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        
        AddPlayerCollectionViewCell.cellDelegate?.updateTextInArray(text: nameTextField.text ?? "", index : nameTextField.tag)
    }
    
    func setCellDelegate(cellDelegate : CellDelegate) {
        AddPlayerCollectionViewCell.cellDelegate = cellDelegate
    }
    

    @IBAction func closeBtnClicked(_ sender: UIButton) {
        AddPlayerCollectionViewCell.cellDelegate?.removePlayer(sender: sender)
    }

    
    
}

