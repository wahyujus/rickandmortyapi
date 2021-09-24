//
//  DashboardCell.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

class DashboardCell: UICollectionViewCell {

    static let reuserID = "DashboardCell"
    let avatarImageView = RMImageView(frame: .zero)
    let usernameLabel = RMTitleLabel(textAlignment: .center, fontSize: 16)
    let speciesLabel = RMTitleLabel(textAlignment: .center, fontSize: 16)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(character: CharacterResult){
        usernameLabel.text = character.name
        speciesLabel.text = "\(character.species) - \(character.status)"
        avatarImageView.downloadImage(from: character.image)
    }

    private func configure(){
        let myViews = [avatarImageView,usernameLabel,speciesLabel]
        
        for item in myViews {
            self.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }

        let padding: CGFloat = 8

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            speciesLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor,constant: 0),
            speciesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            speciesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
