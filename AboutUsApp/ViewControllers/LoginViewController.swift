//
//  ViewController.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 05.06.2025.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = user.username
        passwordTextField.text = user.password
        loginTextField.layer.cornerRadius = 10
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if loginTextField.text != user.username || passwordTextField.text != user.password {
            showAlert(withTitle: "Ошибка", andMessage: "Неверные имя пользователя или пароль")
            return false
        }
        return true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let tabBarController = segue.destination as? OlegViewController
//        tabBarController?.user = user
//    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

