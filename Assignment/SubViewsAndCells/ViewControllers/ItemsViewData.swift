//
//  ItemsViewData.swift
//  Assignment
//
//  Created by Senapathi Rajesh on 01/01/20.
//  Copyright © 2020 Senapathi Rajesh. All rights reserved.
//

import Foundation
import UIKit
class ItemsViewData: NSObject {
    let handler = ApiHandler()
    var jsonRowsArray: [Rows]?
    typealias ItemsCompletionHandler = ([Rows], String) -> Void
 static func instance() -> ItemsViewData {
    return ItemsViewData()
}
    func getItemsList(completionHandler: @escaping ItemsCompletionHandler) {
        handler.makeAPICall(url: Constants.API.BASEURL, method: .GET, success: { (data, _, error) in
            guard let data = data else { return }
            let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
            guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonObj = try decoder.decode(ModelJsonObject.self, from: modifiedDataInUTF8Format)
                self.jsonRowsArray = jsonObj.rows
                completionHandler(self.jsonRowsArray!, jsonObj.title!)
            } catch {
                print(error.localizedDescription)
            }
        },
            failure: { (_, _, _) in
        })
    }
    func populateDataToCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            Constants.SubViewCellConstants.CustomTableCellesuseIdentiFier,
                                                 for: indexPath) as? CustomTableViewCell
        cell?.nameLabel.text =  self.jsonRowsArray?[indexPath.row].title
        cell?.profileImageView.loadImageWithUrl(URL(string: self.jsonRowsArray?[indexPath.row].imageHref ??
            Constants.API.PLACEHOLDERURL)!)
        cell?.jobTitleDetailedLabel.text = self.jsonRowsArray?[indexPath.row].description
        tableView.separatorStyle = .none
        cell?.selectionStyle = .none
        return cell!
    }
}
