//
//  RefreshControl.swift
//  Assignment
//
//  Created by Senapathi Rajesh on 27/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import Foundation
import UIKit

protocol PullToRefreshTableViewDelegate : class {
    func tableViewDidStartRefreshing(tableView: PullToRefreshTableView)
}

class PullToRefreshTableView: UITableView {

    @IBOutlet weak var pullToRefreshDelegate: AnyObject?
    private var refreshContro: UIRefreshControl!
    private var isFirstLoad = true

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        if (isFirstLoad) {
            addRefreshControl()
            isFirstLoad = false
        }
    }

    private func addRefreshControl() {
        refreshContro = UIRefreshControl()
        refreshContro?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshContro?.addTarget(self, action:
            #selector(refresh), for: .valueChanged)
        self.addSubview(refreshControl!)
    }

    @objc private func refresh() {
        (pullToRefreshDelegate as? PullToRefreshTableViewDelegate)?.tableViewDidStartRefreshing(tableView: self)
    }

    func endRefreshing() {
        refreshControl!.endRefreshing()
    }

}
