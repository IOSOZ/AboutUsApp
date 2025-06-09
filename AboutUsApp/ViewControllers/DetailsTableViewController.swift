//
//  DetailsTableViewController.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 07.06.2025.
//

import UIKit

final class DetailsTableViewController: UITableViewController {
    
    var indexOfSite: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = DataManager.shared.getAllSites()[indexOfSite].siteName
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editSite))
    }
    
    @objc private func editSite() {
        let alert = UIAlertController(
            title: "Редактирование данных",
            message: "Введите новые данные",
            preferredStyle: .alert
        )
        
        alert.addTextField() {$0.text = DataManager.shared.getAllSites()[self.indexOfSite].siteAdress}
        alert.addTextField() {$0.text = DataManager.shared.getAllSites()[self.indexOfSite].userName}
        alert.addTextField() {$0.text = DataManager.shared.getAllSites()[self.indexOfSite].password}
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let siteAdress = alert.textFields?[0].text,
                  let username = alert.textFields?[1].text,
                  let password = alert.textFields?[2].text,
                  !siteAdress.isEmpty,
                  !username.isEmpty,
                  !password.isEmpty else {return}
            
            DataManager.shared.getAllSites()[self.indexOfSite].siteAdress = siteAdress
            DataManager.shared.getAllSites()[self.indexOfSite].userName = username
            DataManager.shared.getAllSites()[self.indexOfSite].password = password
            
            self.title = DataManager.shared.getAllSites()[self.indexOfSite].siteName
            self.tableView.reloadData()
        })
        
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension DetailsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siteDetails", for: indexPath)
        
        let sites = DataManager.shared.getAllSites()
        let site = sites[indexOfSite]
        
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0:
            content.text = "URL:"
            content.secondaryText = site.siteAdress
        case 1:
            content.text = "Логин:"
            content.secondaryText = site.userName
        default :
            content.text = "Пароль:"
            content.secondaryText = "••••••••"
        }
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DetailsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row == 2 else {return}
        
        let cell = tableView.cellForRow(at: indexPath)
        let site = DataManager.shared.getAllSites()[indexOfSite]
        
        var content = cell?.defaultContentConfiguration()
        content?.text = "Пароль:"
        content?.secondaryText = site.password
        
        cell?.contentConfiguration = content
    }
}
