//
//  CustomTableViewCell.swift
//  iOSProficiencyExercise
//
//  Created by Senapathi Rajesh on 26/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//
import UIKit

class CustomTableViewCell: UITableViewCell {
 
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView: UIImageView = {
         
         let iv = UIImageView ()
        iv.contentMode = .scaleToFill// image will never be strecthed vertially or horizontally
              iv.translatesAutoresizingMaskIntoConstraints = false
                   iv.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.96, alpha: 1.0)
        iv.tintColor = .black
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
                   return iv
    }()
   
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        self.contentView.addSubview(containerView)
        let dev = self.traitCollection.userInterfaceIdiom
        let guide = self.contentView.safeAreaLayoutGuide
        profileImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:guide.leadingAnchor, constant:10).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0).isActive = true
        if dev == .pad{
            profileImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -350).isActive = true
        }
        else{
            profileImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -240).isActive = true
        }
        containerView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:20).isActive = true
        containerView.trailingAnchor.constraint(equalTo:guide.trailingAnchor, constant:-10).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -30).isActive  = true

        if dev == .pad{
            nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        }
        }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
