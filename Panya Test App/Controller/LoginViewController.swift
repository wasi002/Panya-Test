//
//  LoginViewController.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit
import UIGradient

class LoginViewController: BaseViewController {

    let buttonCornerRadius : CGFloat = 25.0
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
            let glayer = GradientLayer(direction: .topToBottom, colors: [UIColor.gradientTopColor, UIColor.gradientBottomColor])
            self.registerButton.backgroundColor = UIColor.fromGradient(glayer, frame:self.registerButton.frame, cornerRadius: self.buttonCornerRadius)
        })
        
    }
    
    func clearFormData()  {
        emailTextField.text = nil
        passwordTextField.text = nil

    }
    

    @IBAction func register(_ sender: UIButton) {
        
//        self.clearFormData()
//        self.performSegue(withIdentifier: ROUND_STREAK_SEGUE_IDENTIFIER, sender: nil)
//        return
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            
            return
        }
    
        
        if email == "" || password == "" {
            self.showError(error: "SIGNIN_ERROR".localized)
            return
        }
        
        if  !email.isValidEmail() {
            self.showError(error: "EMAIL_INVALID_ERROR".localized)
            return
        }
        
        PLoader.ShowLoader(view: self.view)
        
        Api.default.login(email: email, password: password, onSuccess: { (loginResponse) in
            PLoader.dismissLoader(view: self.view)
            self.clearFormData()
            self.performSegue(withIdentifier: ROUND_STREAK_SEGUE_IDENTIFIER, sender: loginResponse)

        }) { (error) in
            PLoader.dismissLoader(view: self.view)
            self.showError(error: error)

        }
        
    }


}
