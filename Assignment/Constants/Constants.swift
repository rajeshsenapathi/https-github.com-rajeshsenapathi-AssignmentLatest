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
          static let  PLACEHOLDERURL = "https://via.placeholder.com/300"
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
        static let Activity_Title  = "Please Wait.."
        static let REFRESH_CONTROL_Title = "Pull down To Refresh"
    }
   struct Error{
        static let ERROR_MSG = "error"
    }
    struct  InternetConnectivity {
        static let NETWORK_SUCCESS_MSG = "Internet Connection Available!"
         static let NETWORK_Failure_MSG = "Internet Connection not Available!"
    }
    
}
