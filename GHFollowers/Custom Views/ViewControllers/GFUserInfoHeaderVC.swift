//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 09.11.2023.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImgeView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAllignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAllignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements(){
        avatarImgeView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio available"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func addSubview(){
        view.addSubview(avatarImgeView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(locationImageView)
        view.addSubview(bioLabel)
    }
    
    func layoutUI(){
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImgeView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImgeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImgeView.widthAnchor.constraint(equalToConstant: 90),
            avatarImgeView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImgeView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImgeView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImgeView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImgeView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImgeView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImgeView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImgeView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImgeView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

}
