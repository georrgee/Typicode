//
//  Model.swift
//  TakeHome
//
//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    var image: UIImage?
    var title: String?
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}
