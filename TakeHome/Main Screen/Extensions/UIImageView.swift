//  UIImageViewExtension.swift
//  TakeHome
//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import Foundation
import AlamofireImage

extension UIImageView {
    
    //Using the CocoaPod "AlamofireImage", it has a method that can download the image from a url
    func download(url: String?) {
        if let string = url, let link = URL(string: string) {
            af_setImage(withURL: link)
        }
    }
}
