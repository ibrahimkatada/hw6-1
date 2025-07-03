//
//  ViewController.swift
//  hw6-1
//
//  Created by Ибрагим Чахкиев on 01.07.2025.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "1"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.userName = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title:"Invalid login or password",
                message: "Plese, enter correct login and password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "ooops", message: "Youre name is \(user)")
        : showAlert(title: "ooops", message: "Youre password is \(password)")
    }

    @IBAction override func unwind(for Segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    private func showAlert(title: String, message: String, comletion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            comletion?()
            
        }
        alert.addAction(okAction)
        present(alert,animated: true)
    }
}

