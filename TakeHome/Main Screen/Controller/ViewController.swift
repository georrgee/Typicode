//  ViewController.swift
//  TakeHome

//  Created by ZapLabs on 3/7/16.
//  Copyright © 2018 ZipRealty. All rights reserved.

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    var dataSource = [Info]() { didSet { tableView.reloadData() } }
    var tableView  = UITableView()
}

// MARK: - Life Cycle
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
        view.backgroundColor = UIColor.white
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Network Call
extension ViewController {
    
    func getData() {
        guard let jsonURL = URL(string: NetworkService.shared.jsonURL) else {return}
        NetworkService.shared.fetchData(with: jsonURL, success: {(data) in
            self.dataSource = data
        }, failure: { error in
            self.alert(title: "Network Error", message: "Oops! Looks like there is a network error. Please try again later")
        })
    }
}

// MARK: - TableView Setup
extension ViewController {
    
    func setupTableViewUI() {
        
        tableView.frame             = self.view.frame
        tableView.delegate          = self
        tableView.dataSource        = self
        tableView.allowsSelection   = false
        tableView.separatorInset    = UIEdgeInsetsMake(0, 125, 0, 0)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView) // add this tableview to the view controller
    }
}

// MARK: - Notes/Comments

/*
 1) Learning how Dispatch.async works
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
        view.backgroundColor = UIColor.green
        getData()
        demoDispatch()
        print("nothing")
    }
 
    func demoDispatch() {
 
        DispatchQueue(label: "downloadImge").async {
                // code here
            DispatchQueue.main.async {
            // i.e. update the Image view here
            }
           }
    }
*/
