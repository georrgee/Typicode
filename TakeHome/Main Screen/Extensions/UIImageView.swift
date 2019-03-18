//  UIImageView.swift
//  TakeHome

//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import Foundation
import AlamofireImage

// MARK: - UIImageView
extension UIImageView {
    
    func downloadImageFromURL(url: String?) {
        if let string = url, let link = URL(string: string) {
            af_setImage(withURL: link)
        }
    }
}
// MARK: - Notes/Comments
/*
    1) Using the CocoaPod "AlamofireImage", it has a method that can download the image from a url
*/
