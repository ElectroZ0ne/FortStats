//
//  MainVC.swift
//  FortStats
//
//  Created by ElectroZone on 2018-03-10.
//  Copyright © 2018 Wassim Mouhajer. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pcButton: UIButton!
    @IBOutlet weak var ps4Button: UIButton!
    @IBOutlet weak var xboxButton: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.returnKeyType = .done
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }
    
  
    override func viewWillDisappear(_ animated: Bool) {
        var type = selectType()
        var username = textField.text
        //Set the type
        User.sharedInstance.type = type
        //Set the username
        User.sharedInstance.username = username
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField.text = ""
        ps4Button.isSelected = false
        xboxButton.isSelected = false
        pcButton.isSelected = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func showStats() {
        //Internet, selected, input
        if isInternetAvailable() && selection() && textField.text != "" {
            performSegue(withIdentifier: "statsVC", sender: self)
        //Internet, not selection
        } else if isInternetAvailable() && selection() == false {
            let alert = UIAlertController(title: "Platform", message: "Please select a specific platform for the Fortnite account.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        //Internet, selection but no input
        } else if isInternetAvailable() && selection() && textField.text == "" {
            var emptyAlert = UIAlertController(title: "No name", message: "Please write the name of the Fortnite account.", preferredStyle: .alert)
            emptyAlert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
            present(emptyAlert, animated: true, completion: nil)
        }  else {
            var refreshAlert = UIAlertController(title: "Connection Error", message: "Check your internet connection and try again.", preferredStyle: UIAlertControllerStyle.alert)
            refreshAlert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { (action: UIAlertAction!) in
            }))
            present(refreshAlert, animated: true, completion: nil)
        }
    }
    
    
    //Check if a selection has been made
    func selection() -> Bool {
        if pcButton.isSelected {
            return true
        } else if ps4Button.isSelected {
            return true
        } else if xboxButton.isSelected {
            return true
        } else {
            return false
        }
    }
    
    //String of the selection
    func selectType() -> String {
        if pcButton.isSelected {
            return "pc"
        } else if ps4Button.isSelected {
            return "psn"
        } else if xboxButton.isSelected {
            return "xbox"
        } else {
            return ""
        }
    }
    

    //Set the selection
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender.tag == 0 {
            pcButton.isSelected = true
            ps4Button.isSelected = false
            xboxButton.isSelected = false
        } else if sender.tag == 1 {
            pcButton.isSelected = false
            ps4Button.isSelected = true
            xboxButton.isSelected = false
        } else if sender.tag == 2 {
            pcButton.isSelected = false
            ps4Button.isSelected = false
            xboxButton.isSelected = true
        }
    }
    
    @IBAction func search(_ sender: UIButton) {
        showStats()
    }
}
