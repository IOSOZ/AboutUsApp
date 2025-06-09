//
//  CreatorTableViewCell.swift
//  AboutUsApp
//
//  Created by serj on 08.06.2025.
//

// CreatorTableViewCell.swift

import UIKit

class CreatorTableViewCell: UITableViewCell {
    @IBOutlet weak var creatorImageView: UIImageView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        creatorImageView.layer.cornerRadius = creatorImageView.frame.size.width / 2
        contentView.layer.cornerRadius = 15
        backgroundColor = .clear
        
    
    }
    
    func configure(with person: Person) {
        creatorImageView.image = UIImage(named: person.photo)
        surnameLabel.text = person.surname
        nameLabel.text = person.name
        ageLabel.text = person.age
    }
}
