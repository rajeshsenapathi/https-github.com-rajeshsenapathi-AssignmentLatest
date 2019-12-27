//
//  Extensions.swift
//  iOSProficiencyExercise
//
//  Created by Senapathi Rajesh on 26/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import Foundation
import UIKit
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let jsonCount = self.jsonRowsArray?.count{
            return jsonCount
        }
        else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SubViewCellConstants.Custom_TableCell_resuseIdentiFier, for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text =  self.jsonRowsArray?[indexPath.row].title
        cell.jobTitleDetailedLabel.text = self.jsonRowsArray?[indexPath.row].description
        DispatchQueue.main.async {
              cell.profileImageView.image = UIImage(named: Constants.ImageConstatnts.Placeholder_ImageName)
        }
            cell.profileImageView.downloadImageFrom(link: self.jsonRowsArray?[indexPath.row].imageHref ?? Constants.ImageConstatnts.Placeholder_ImageName, contentMode: .scaleToFill)
        
      
        let image =    cell.profileImageView.image
        _ =  image?.image(alpha: 0.5)

        self.canadaTableView.separatorStyle = .none
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
            return UITableView.automaticDimension
        
    }
   
    
    func presentNetowrkAlertWithTwoButton(withTitle title: String, message : String, actionHandler: ((UIAlertAction) -> Void)?) {
                let alertController = UIAlertController(title: title, message:"", preferredStyle: .alert)
        let CancelAction = UIAlertAction(title: Constants.AlertConstatnts.CANCEL_MSG, style: .cancel,handler: actionHandler)
        let RetryAction = UIAlertAction(title: Constants.AlertConstatnts.RETRY_MSG, style: .default, handler: actionHandler)
        alertController.addAction(CancelAction)
        alertController.addAction(RetryAction)
        alertController.preferredAction = RetryAction
        self.present(alertController, animated: true, completion: nil)
    }
    func presentAlert(withTitle title: String, message : String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let OKAction = UIAlertAction(title: "OK", style: .default) { action in
               print("You've pressed OK Button")
           }
           alertController.addAction(OKAction)
           self.present(alertController, animated: true, completion: nil)
       }
       
    
}
 
extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        DispatchQueue.global().async {
            URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    self.contentMode =  contentMode
                    if let data = data {
                    self.image = UIImage(data: data)
                    }
                   
                }
            }).resume()
        }
        
    }
}
