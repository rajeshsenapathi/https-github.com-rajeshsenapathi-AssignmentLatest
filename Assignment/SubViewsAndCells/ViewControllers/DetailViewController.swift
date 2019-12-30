//
//  DetailViewController.swift
//  Assignment
//
//  Created by Senapathi Rajesh on 30/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var imageView  = UIImageView()
    var imageUrl: String?
   var DetailLabel :UILabel = {
        let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 14)
        label.textColor =  #colorLiteral(red: 0.002122662263, green: 0.4628389478, blue: 0.9952664971, alpha: 1)
        label.backgroundColor = UIColor.white
         label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DetailViewController"
        self.view.backgroundColor = .white
         view?.addSubview(imageView)
         self.view.addSubview(DetailLabel)
        let guide = view.safeAreaLayoutGuide
        imageView.image = UIImage(named: Constants.ImageConstatnts.Placeholder_ImageName)
        imageView.downloadImageFrom(link: self.imageUrl ?? Constants.API.PLACEHOLDERURL, contentMode: .scaleToFill)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        DetailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive  = true
        DetailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        DetailLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
      
    }
    
}
