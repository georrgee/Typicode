//  UIViewController.swift
//  TakeHome
//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

// MARK: - Life Cycle
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViewUI()
        self.view.backgroundColor = UIColor.green
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
