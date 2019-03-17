//  Info.swift
//  TakeHome
//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import Foundation
import SwiftyJSON

struct Info {
    let image_url: String?
    let title:     String?
}

extension Info {
    
    init(rawData: JSON) {
        image_url = rawData["thumbnailUrl"].stringValue
        title     = rawData["title"].stringValue
    }
}

// MARK: Notes/Comments

/*
 
 1) This method was inside the struct Info block
 
     init(rawData: JSON) {
         image_url = rawData["thumbnailUrl"].stringValue
         title     = rawData["title"].stringValue
     }
 
*/
