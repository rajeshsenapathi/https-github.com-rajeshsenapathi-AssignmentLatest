//
//  Extensions.swift
//  iOSProficiencyExercise
//
//  Created by Senapathi Rajesh on 26/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import Foundation
import UIKit
extension ItemsViewController: UITableViewDelegate,UITableViewDataSource {
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
        cell.profileImageView.downloadImageFrom(link: self.jsonRowsArray?[indexPath.row].imageHref ?? Constants.API.PLACEHOLDERURL, contentMode: .scaleToFill)
        self.canadaTableView.separatorStyle = .none
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        let selectedRow = indexPath.row
        if selectedRow  == indexPath.row{
        vc.DetailLabel.text  = self.jsonRowsArray?[indexPath.row].description
        vc.imageUrl =   self.jsonRowsArray?[indexPath.row].imageHref
        }
      
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
       
    
}
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        DispatchQueue.global().async { [weak self] in
            URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    self?.image = UIImage(named: Constants.ImageConstatnts.Placeholder_ImageName)
                    self?.contentMode =  contentMode
                    if let data = data {
                        self?.image = UIImage(data: data)
                    }
                    if self?.image == nil{
                        self?.image = UIImage(named: Constants.ImageConstatnts.Placeholder_ImageName)
                    }
                }
            }).resume()
        }
   
    }
}
extension UIView{
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor,title: String,center: CGPoint) {
    let backgroundView = UIView()
    backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    backgroundView.backgroundColor = backgroundColor
    backgroundView.tag = 475647
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    activityIndicator.center = self.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.large
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        titleLabel.text = title
    titleLabel.textColor = UIColor.black
    activityIndicator.color = activityColor
    activityIndicator.startAnimating()
    self.isUserInteractionEnabled = false

    backgroundView.addSubview(activityIndicator)
    activityIndicator.addSubview(titleLabel)

    self.addSubview(backgroundView)
}

func activityStopAnimating() {
    if let background = viewWithTag(475647){
        background.removeFromSuperview()
    }
    self.isUserInteractionEnabled = true
}

}
