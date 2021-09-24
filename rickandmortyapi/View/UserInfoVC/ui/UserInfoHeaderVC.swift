//
//  UserInfoHeaderVC.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

class UserInfoHeaderVC: UIViewController {

    let avatarImageView = RMImageView(frame: .zero)
    let usergenderLabel = RMTitleLabel(textAlignment: .left, fontSize: 34)
    let genderLabel = RMSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = RMSecondaryTitleLabel(fontSize: 18)
    let originLabel = RMBodyLabel(textAlignment: .left)
    
    var user: SingleCharacter!
    
    init(user:SingleCharacter) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements(){
        avatarImageView.downloadImage(from: user.image)
        usergenderLabel.text = user.name
        genderLabel.text = "\(user.gender) - \(user.origin.name)"
        locationLabel.text = user.location.name
        originLabel.text = user.episode.joined(separator: "\n")
        originLabel.numberOfLines = user.episode.count
        
        locationImageView.image = UIImage.init(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func addSubViews(){
        let myViews = [avatarImageView,usergenderLabel,genderLabel,locationImageView,locationLabel,originLabel]
        
        for item in myViews {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func layoutUI(){
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            //avatar image setup
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            //username setup
            usergenderLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usergenderLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: textImagePadding),
            usergenderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            usergenderLabel.heightAnchor.constraint(equalToConstant: 38),
            
            //genderLabel setup
            genderLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            genderLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //locationImageView Setup
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            //location setup
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //originLabel setup
            originLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,constant: textImagePadding),
            originLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            originLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            originLabel.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }

}
