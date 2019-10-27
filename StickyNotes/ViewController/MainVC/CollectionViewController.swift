//
//  CollectionViewController.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-09-30.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Modules

import UIKit
import RealmSwift

//MARK:-class

class CollectionViewController: UIViewController {
   
    //MARK: -Variables
    
    let reuseIdentifier = "cell"
    let segueIndentifier = "popSegue"
    var viewModel  = ViewModel()
    
    //MARK: -OUTLETS
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var bacgroundImageView: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var sideViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var settingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var icon: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var backgr: UIButton!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
     }

    //MARK: -UIConfiguration
    
    func configureUI() {
        sideView.shadow()
        backgr.setTitle(Background.wood, for: .normal)
        icon.setTitle(Titles.large, for: .normal)
    }
    
    //MARK: - Actions
    
    @IBAction func background(_ sender: Any) {
        switch viewModel.background {
        case Background.table:
                viewModel.background = Background.wood
                   DispatchQueue.main.async {
                    self.bacgroundImageView.image = UIImage(named: Background.wood)
                    self.backgr.setTitle(Background.wood, for: .normal)
            }
               default:
                viewModel.background = Background.table
                   DispatchQueue.main.async {
                    self.bacgroundImageView.image = UIImage(named: Background.table)
                    self.backgr.setTitle(Background.table, for: .normal)
                   }
            }
    }
    
    @IBAction func changeSize(_ sender: Any) {
        switch viewModel.size {
        case Sizes.largeSize:
            viewModel.size = Sizes.smallSize
            DispatchQueue.main.async {
                self.collection.reloadData()
                self.icon.setTitle(Titles.small, for: .normal)
            }
        default:
            viewModel.size = Sizes.largeSize
            DispatchQueue.main.async {
                self.collection.reloadData()
                self.icon.setTitle(Titles.large, for: .normal)
            }
        }
    }

    @IBAction func settings(_ sender: Any) {
        showSideMenu()
    }
    
    //MARK: - Functions
    
    func showSideMenu(){
        if viewModel.isSettingsEdit == false {
            showSettings()
        } else {
            hideSettings()
        }
    }
    
    func showSettings() {
        sideViewConstraint.constant = 0
        settingConstraint.constant += 200
        collection.alpha = 0.8
        addButton.isEnabled = false
        addButton.alpha = 0
        settingButton.setImage(UIImage(named: Titles.delete), for: .normal)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        settingButton.pulse()
        icon.pulse()
        backgr.pulse()
        viewModel.isSettingsEdit = !viewModel.isSettingsEdit
    }
    
    func hideSettings() {
        sideViewConstraint.constant = -200
            settingConstraint.constant -= 200
            collection.alpha = 1.0
            addButton.alpha = 1.0
            addButton.isEnabled = true
            settingButton.setImage(UIImage(named: Titles.settings), for: .normal)
            UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
            viewModel.isSettingsEdit = !viewModel.isSettingsEdit
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIndentifier {
            if let popVC = segue.destination as? PopViewController {
                popVC.viewModel = viewModel
                popVC.delegate = self
            }
        }
    }
}
    
//MARK:-UITextFieldDelegate Extension

extension CollectionViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //card.resignFirstResponder()
        return true
    }
}

//MARK:-Protocol Functions {

extension CollectionViewController: ViewModelProtocol {
    func reload() {
        collection.reloadData()
    }
    
    func deleteFromCollection() {
        collection.performBatchUpdates({
            collection.deleteItems(at: [IndexPath(row: viewModel.selectedRow, section: 0)])
        }, completion: nil)
    }
       
    func insertToCollection() {
        collection.performBatchUpdates({
            collection.insertItems(at: [IndexPath(row: viewModel.notes.count - 1, section: 0)])
            collection.reloadData()
            }, completion: nil)
    }
}



