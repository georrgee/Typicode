//
//  ViewController.swift
//  TakeHome
//
//  Created by ZapLabs on 3/7/16.
//  Copyright © 2018 ZipRealty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    // MARK: - Properties
    var dataSource = [Info]() { didSet { tableView.reloadData() } }
    var tableView  = UITableView()
    
//    func getData() {
//        guard let jsonURL = URL(string: NetworkService.shared.jsonURL) else {return}
//        NetworkService.shared.fetchData(with: jsonURL, success: {(data) in
//            self.dataSource = data
//        }, failure: { error in
//            self.alert(title: "Network Error", message: "Oops! Looks like there is a network error. Please try again later")
//        })
//    }
}
