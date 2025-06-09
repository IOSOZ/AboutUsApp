//
//  SergViewController.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 05.06.2025.
//

import UIKit

final class PasswordsListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Менджер паролей"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewSite))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let detailsVC = segue.destination as? DetailsTableViewController
        detailsVC?.indexOfSite = indexPath.row
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc private func addNewSite() {
        let alert = UIAlertController(
            title: "Новый пароль",
            message: "Введите данные",
            preferredStyle: .alert
        )
        
        alert.addTextField {$0.placeholder = "Адрес сайта"}
        alert.addTextField {$0.placeholder = "Логин"}
        alert.addTextField {$0.placeholder = "Пароль"}
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let siteAdress = alert.textFields?[0].text,
            let username = alert.textFields?[1].text,
            let password = alert.textFields?[2].text,
            !siteAdress.isEmpty,
            !username.isEmpty,
            !password.isEmpty else {return}
            
            let newSite = SiteInfo(siteAdress: siteAdress, userName: username, password: password)
            DataManager.shared.addSite(newSite)
            self.tableView.reloadData()
        })
        
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension PasswordsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.getAllSites().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "site", for: indexPath)
        
        let sites = DataManager.shared.getAllSites()
        let site = sites[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = site.siteName
        content.secondaryText = site.siteAdress
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PasswordsListViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManager.shared.deleteSiteWith(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

