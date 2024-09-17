//
//  AddPlayerView.swift
//  TruthOrDare
//
//  Created by Marcus Thuvesen on 2021-12-15.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

class AddPlayerView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CellDelegate{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addPlayerOutlet: UIButton!
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var emitterView: UIView!
    @IBOutlet weak var waveImg: UIImageView!
    @IBOutlet weak var warningPopup: UIView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var minimumPlayersLabel: UILabel!
    
    let reuseIdentifier = "AddPlayerCollectionViewCell"
    var playerList = ["Name 1".localized(), "Name 2".localized()]
    
    
    let addPlayerCollectionCellViewDelegate = AddPlayerCollectionViewCell()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddPlayerDelegate()
            //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        createParticles()
        setupAddPlayerUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupAddPlayerUI() {
        playOutlet.layer.cornerRadius = 25
        addPlayerOutlet.layer.cornerRadius = 10
        addPlayerOutlet.layer.masksToBounds = true
        addPlayerOutlet.layer.borderWidth = 1
        addPlayerOutlet.layer.borderColor = UIColor.premiumPurple.cgColor
        warningPopup.layer.cornerRadius = 10
        warningPopup.layer.masksToBounds = true
        warningPopup.isHidden = true
        
        
        addPlayerOutlet.setTitle("+ ADD PLAYER", for: .normal)
        playOutlet.setTitle("Play", for: .normal)
        playerLabel.text = "Who is playing?"
        minimumPlayersLabel.text = "Add at least 2 players"
        
    }
    
    
    func updateTextInArray(text : String, index : Int) {
        print(text)
        playerList[index] = text
    }
    
    func createParticles() {
        
        let emitter = Emitter.get(with: UIImage(named: "bubble2")!)
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: emitterView.frame.height / 2)
        emitter.emitterSize = CGSize(width: view.frame.width, height: emitterView.frame.height)
        
        emitterView.layer.addSublayer(emitter)
        
    }
    
    func setupAddPlayerDelegate(){
        addPlayerCollectionCellViewDelegate.setCellDelegate(cellDelegate: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AddPlayerCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.tag = indexPath.row
        cell.nameTextField.tag = indexPath.row
        cell.nameTextField.placeholder = "Name" + " \(indexPath.item+1)"
        cell.closeButton.tag = indexPath.row
        cell.nameTextField.text = playerList[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPlayerCollectionViewCell", for: indexPath as IndexPath) as! AddPlayerCollectionViewCell
        cell.nameTextField.becomeFirstResponder()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 100)

    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
    func removePlayer(sender: AnyObject?) {
        guard let id = sender?.tag else { return }
        let indexPath = [IndexPath(row: id, section: 0)]

        collectionView.deleteItems(at: indexPath)
        playerList.remove(at: id)
        dump(playerList)
    }
    
    @IBAction func addPlayerAction(_ sender: UIButton) {
        playerList.append("")
        
        let indexPath = [IndexPath(row: playerList.count-1, section: 0)]
        collectionView.insertItems(at: indexPath)
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        
        if playerList.count > 1 {
            
            var i = 0
            for name in playerList {
                if name == "" {
                    playerList.remove(at: i)
                    i-=1
                }
                i+=1
            }
            UserDefaults.standard.setValue(playerList, forKey: "PLAYERLIST")
            self.dismiss(animated: true, completion: nil)
        } else {
            warningPopup.isHidden = false
        }
        
    }
    
}
