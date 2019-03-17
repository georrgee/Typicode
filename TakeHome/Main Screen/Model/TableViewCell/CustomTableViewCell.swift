//  CustomTableViewCell.swift
//  TakeHome
//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var data: Info?
    
    // MARK: - TableViewCell Content Creation
    lazy var cellBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var jsonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var jsonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override func layoutSubviews() {
        //contentView.backgroundColor = UIColor.white
        //backgroundColor = UIColor.gray
        //cellBackgroundView.clipsToBounds = true
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
}

// MARK: - TableViewCell UI Setup
extension CustomTableViewCell {
    
    func setupCellBackgroundView() {
        addSubview(cellBackgroundView)
        cellBackgroundView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: self.frame.width - 20, height: 120)
    }
    
    func setupJSONImageView() {
        
        addSubview(jsonImageView)
        
        jsonImageView.download(url: data?.image_url)
        
        jsonImageView.setAnchor(top: cellBackgroundView.topAnchor, left: cellBackgroundView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 80, height: 150)
        jsonImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupJSONLabel() {
        
        addSubview(jsonLabel)
        
        jsonLabel.text = "\(data?.title ?? "N/A")"
        
        jsonLabel.setAnchor(top: cellBackgroundView.topAnchor, left: jsonImageView.leftAnchor, bottom: nil, right: cellBackgroundView.rightAnchor, paddingTop: 40, paddingLeft: 90, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        jsonLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        jsonLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}


// MARK: - Notes/Comments

/*
    1) UIView UI Testing
    - imageView.backgroundColor = UIColor.black (to see the size and where the ImageView is located)
    - label.backgroundColor = UIColor.gray
 
    2) Using "Lazy"
    -When dealing with iOS Development, we should be really conscious about the amount of memory used by the application
    -creating lazy vars will only be specified when it is requested
 
*/
