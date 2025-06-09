//
//  ViewController.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 05.06.2025.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = user.username
        passwordTextField.text = user.password
        loginTextField.layer.cornerRadius = 10
        logInButton.layer.cornerRadius = 10
    }
    
    // MARK: - Override methods
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if loginTextField.text != user.username || passwordTextField.text != user.password {
            showAlert(withTitle: "Ошибка", andMessage: "Неверные имя пользователя или пароль")
            return false
        }
        return true
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func tintPasswordButtonPressed() {
        showAlert(withTitle: "Логин и пароль", andMessage: "Логин: \(user.username) Пароль: \(user.password)")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}
