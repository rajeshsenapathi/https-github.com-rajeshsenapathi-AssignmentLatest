//
//  Constants.swift
//  iOSProficiencyExercise
//
//  Created by Senapathi Rajesh on 26/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import Foundation
struct  Constants {
    
    struct  API {
          static let BASEURL  = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        static let  PLACEHOLDERURL = "http://cdn.businessoffashion.com/site/uploads/2014/09/Karl-Lagerfeld-Self-Portrait-Courtesy.jpg"
    }
    struct  SubViewCellConstants {
        static let Custom_TableCell_resuseIdentiFier = "CustomTableViewCell"
    }
    struct ImageConstatnts{
        
        static let Placeholder_ImageName = "placeholder"
    }
    struct AlertConstatnts {
        static let CANCEL_MSG = "Cancel"
         static let RETRY_MSG = "Retry"
        static let TITLE  = "ConnectionError"
        static let Title_Msg = "Internet Not Working Click Retry to Refresh"
    }
   struct Error{
        static let ERROR_MSG = "error"
    }
    struct  InternetConnectivity {
        static let NETWORK_SUCCESS_MSG = "Internet Connection Available!"
         static let NETWORK_Failure_MSG = "Internet Connection not Available!"
    }
    
}
