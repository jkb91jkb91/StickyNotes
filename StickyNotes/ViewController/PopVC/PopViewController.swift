//
//  PopViewController.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-15.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Module

import UIKit

//MARK:-Protocol

protocol ViewModelProtocol: class {
    func insertToCollection()
    func deleteFromCollection()
    func reload()
}
//MARK:-Class

class PopViewController: UIViewController {

//MARK: -Outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var saveBtnOutlet: UIButton!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    @IBOutlet weak var xBtnOutlet: UIButton!
    @IBOutlet weak var textF: UITextView!
    @IBOutlet weak var firstCardColor: UIButton!
    @IBOutlet weak var secondCardColor: UIButton!
    @IBOutlet weak var redCardColor: UIButton!
    @IBOutlet weak var popUpYConstraint: NSLayoutConstraint!
    
//MARK:-Properties
    
    var viewModel: ViewModel?
    weak var delegate : ViewModelProtocol? = nil
    
//MARK: -Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        addObservers()
    }
    override func viewWillAppear(_ animated: Bool) {
      showAferAppearing()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel?.editSelected = false
    }
   
//MARK:-UIsetup
    
    func configure() {
        saveBtnOutlet.visualButton()
        xBtnOutlet.visualButton()
        cancelBtnOutlet.visualButton()
        firstCardColor.visualButton()
        secondCardColor.visualButton()
        redCardColor.visualButton()
        mainView.shadow()
        textF.delegate = self
    }
    
//MARK: -Actions
       
       @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
       }
       
       @IBAction func saveBtn(_ sender: Any) {
        switch viewModel?.editSelected {
        case false:
            viewModel?.saveCardData(text: textF.text)
            delegate?.insertToCollection()
            dismiss(animated: true, completion: nil)
        default:
            let row = viewModel!.selectedRow
            let text = textF.text ?? ""
            let color = viewModel!.selectedColor
            viewModel?.updateCardData(row: row, text: text, color: color)
            delegate?.reload()
            dismiss(animated: true, completion: nil)
       }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        viewModel?.deleteCardData()
        delegate?.deleteFromCollection()
        dismiss(animated: true, completion: nil)
       }
    
       @IBAction func yellowBtnOne(_ sender: UIButton) {
           DispatchQueue.main.async {
               sender.border()
            self.viewModel?.selectedColor = ColorsToSave.yellow
            self.mainView.backgroundColor = Colors.yellow
            self.secondCardColor.cancelBorder()
            self.redCardColor.cancelBorder()
           }
       }
    
       @IBAction func greenBtnSecond(_ sender: UIButton) {
           DispatchQueue.main.async {
               sender.border()
            self.viewModel?.selectedColor = ColorsToSave.green
            self.mainView.backgroundColor = Colors.green
            self.firstCardColor.cancelBorder()
            self.redCardColor.cancelBorder()
           }
        }
    
    @IBAction func redBtnThird(_ sender: UIButton) {
        DispatchQueue.main.async {
            sender.border()
            self.viewModel?.selectedColor = ColorsToSave.red
        self.mainView.backgroundColor = Colors.red
        self.firstCardColor.cancelBorder()
        self.secondCardColor.cancelBorder()
        }
    }
    
    //MARK:-target actions
    
    @objc func keyboardWillShow() {
        popUpYConstraint.constant -= 100
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide() {
        popUpYConstraint.constant += 100
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }

    //MARK:-functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textF.resignFirstResponder()
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
    
    func showAferAppearing(){
        if viewModel?.editSelected == true {
            textF.text = viewModel?.notes[viewModel!.selectedRow].note
            switch viewModel?.selectedColor {
            case ColorsToSave.yellow:
                firstCardColor.border()
                mainView.backgroundColor = Colors.yellow
            case ColorsToSave.green:
                secondCardColor.border()
                mainView.backgroundColor = Colors.green
            default:
                redCardColor.border()
                mainView.backgroundColor = Colors.red
            }
        } else {
            viewModel?.selectedColor = ColorsToSave.yellow
            firstCardColor.border()
        }
        saveBtnOutlet.isHidden = true
    }
}

//MARK:-UITextFieldDelegate extension

extension PopViewController: UITextViewDelegate {
    func textViewShouldReturn(_ textField: UITextView) -> Bool {
        textF.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveBtnOutlet.isHidden = false
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: view.layoutIfNeeded, completion: nil)
    }
}
    

