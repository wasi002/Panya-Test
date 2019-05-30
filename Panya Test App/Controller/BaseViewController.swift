//
//  BaseViewController.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var screenTitle = ""
   
    
    @IBOutlet weak var leftButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func showError(error : String) {
        let alert = UIAlertController(title: "ERROR".localized, message: error,  preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK".localized, style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ROUND_STREAK_SEGUE_IDENTIFIER {
            let destinationVC = segue.destination as! RoundStreakViewController
            let loginResponse = sender as? LoginResponse
            destinationVC.loginResponse = loginResponse
        }
        
    }
}

extension BaseViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
