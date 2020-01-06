//
//  UIviewcontroller+Alert.swift
//  Assignment
//
//  Created by Senapathi Rajesh on 06/01/20.
//  Copyright © 2020 Senapathi Rajesh. All rights reserved.
//

import Foundation
import  UIKit
extension UIViewController {
    func presentNetowrkAlertWithTwoButton(withTitle title: String,
                                          message: String, actionHandler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Constants.AlertConstatnts.CANCELMSG,
                                         style: .cancel, handler: actionHandler)
        let retryAction = UIAlertAction(title: Constants.AlertConstatnts.RETRYMSG,
                                        style: .default, handler: actionHandler)
        alertController.addAction(cancelAction)
        alertController.addAction(retryAction)
        alertController.preferredAction = retryAction
        self.present(alertController, animated: true, completion: nil)
    }
}
