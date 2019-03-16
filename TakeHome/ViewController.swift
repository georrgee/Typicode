//
//  ViewController.swift
//  TakeHome
//
//  Created by ZapLabs on 3/7/16.
//  Copyright © 2018 ZipRealty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Declare any variables here.
    var model = [Model]()

    // Hint: Add a tableView to the main viewController
    var tableView = UITableView() // creating the tableview
}


// Bonus: Separate out protocol stubs/methods into extensions

// MARK: - Life Cycle

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addImagesAndLabels()
        setupUITableView()
        // Do any additional setup after loading the view.

        //self.view.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.red

        // Hint: Use Auto Layout to tie a UITableView to this viewController
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


// MARK: - DataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
            else { fatalError("Unable to create cell")
        }
        
        cell.jsonImageView.image = model[indexPath.row].image
        cell.jsonLabel.text = "\(indexPath.row) - \(model[indexPath.row].title ?? "Unknown")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func setupUITableView() {
        
        tableView.frame             = self.view.frame
        tableView.backgroundColor   = UIColor.clear
        tableView.delegate          = self
        tableView.dataSource        = self
        
        tableView.separatorColor    = UIColor.clear // "removing" the seperator
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView) // add this tableview to the view controller
        
    }
    
    func addImagesAndLabels() {
        model.append(Model(image: #imageLiteral(resourceName: "lp_logo"), title: "Linkin Park"))
        model.append(Model(image: #imageLiteral(resourceName: "chon_logo"), title: "Chon"))
        model.append(Model(image: #imageLiteral(resourceName: "cube_album"), title: "You know how we do it"))
    }
}
