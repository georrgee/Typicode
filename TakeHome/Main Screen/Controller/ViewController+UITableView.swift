//  ViewController+UITableView.swift
//  TakeHome

//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

// MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
            else { return UITableViewCell() }
        
        var data = dataSource[indexPath.row]
        data.title = "\(indexPath.row) - \(data.title ?? "")"
        cell.setData(data)
 
        return cell
    }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
