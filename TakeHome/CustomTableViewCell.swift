//
//  CustomTableViewCell.swift
//  TakeHome
//
//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

// Notes: 1) When dealing with iOS Development, we should be really conscious about the amount of memory used by the application

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    lazy var cellBackgroundView: UIView = {   // creating lazy vars will only be specified when it is requested
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var jsonImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var jsonLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .left
        label.font          = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = UIColor.gray
        return label
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        cellBackgroundView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {           // Configure the view for the selected state
        super.setSelected(selected, animated: animated)
        
        setupCellBackgroundView()
        setupJSONImageView()
        setupJSONLabel()
    }
    
    func setupCellBackgroundView() {
        addSubview(cellBackgroundView)
        cellBackgroundView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: self.frame.width - 20, height: 120)
    }
    
    func setupJSONImageView() {
        
        addSubview(jsonImageView)
        jsonImageView.setAnchor(top: cellBackgroundView.topAnchor, left: cellBackgroundView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 80, height: 150)
        jsonImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupJSONLabel() {
        addSubview(jsonLabel)
        jsonLabel.setAnchor(top: cellBackgroundView.topAnchor, left: jsonImageView.leftAnchor, bottom: nil, right: cellBackgroundView.rightAnchor, paddingTop: 40, paddingLeft: 90, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        jsonLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        jsonLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
