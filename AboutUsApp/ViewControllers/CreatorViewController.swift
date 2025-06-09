import UIKit

class CreatorViewController: UITableViewController {

    let creators: [Person] = [
        Person(name: "Олег", surname: "Зуев", age: "25", photo: "photo_Oleg"),
        Person(name: "Сергей", surname: "Макаров", age: "28", photo: "photo_Sergey")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
           tableView.estimatedRowHeight = 400
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        creators.count
    }
   
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let footerView = UIView()
            footerView.backgroundColor = .clear
            return footerView
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "creatorCell", for: indexPath) as? CreatorTableViewCell else {
            fatalError("Cell is not of type CreatorTableViewCell")
        }
        
        
        let person = creators[indexPath.row]
        cell.configure(with: person)
        
        return cell
    }
}
