//  CustomTableViewCell.swift
//  TakeHome

//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    fileprivate var data: Info?
    
    // MARK: - TableViewCell Content Creation
    let cellBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    let colorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public Functions
    func setupView() {
        setupCellBackgroundView()
        setupColorImageView()
        setupTitleLabel()
    }
    
    func setData(_ data: Info) {
        self.data = data
        colorImageView.downloadImageFromURL(url: data.thumbnailUrl)
        titleLabel.text = data.title
    }
}

// MARK: - TableViewCell AutoLayout Configuartion
extension CustomTableViewCell {
    
    func setupCellBackgroundView() {
        addSubview(cellBackgroundView)
        
        cellBackgroundView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0)
    }
    
    func setupColorImageView() {
        
        addSubview(colorImageView)
        
        colorImageView.setAnchor(top: nil, left: cellBackgroundView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        colorImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setAnchor(top: cellBackgroundView.topAnchor, left: colorImageView.leftAnchor, bottom: nil, right: cellBackgroundView.rightAnchor, paddingTop: 40, paddingLeft: 90, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

// MARK: - Notes/Comments

/*
    1) UIView UI Testing
    - imageView.backgroundColor = UIColor.black (to see the size and where the ImageView is located)
    - label.backgroundColor = UIColor.gray
*/
