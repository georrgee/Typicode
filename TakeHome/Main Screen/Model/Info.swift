//  Info.swift
//  TakeHome

//  Created by George Garcia on 3/15/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import Foundation
import SwiftyJSON

// MARK: Struct Properties
struct Info {
    var albumId:       Int?
    var id:            Int?
    var title:         String?
    var url:           String?
    var thumbnailUrl:  String?
}

// MARK: Struct Initializer
extension Info {
    init(rawData: JSON) {
        albumId      = rawData["albumId"].intValue
        id           = rawData["id"].intValue
        title        = rawData["title"].stringValue
        url          = rawData["url"].stringValue
        thumbnailUrl = rawData["thumbnailUrl"].stringValue
    }
}

// MARK: Notes/Comments
/*
    1) This method was inside the struct Info block.(Since I made an extension, I research structs and extensions and thought this could be good practice)
     init(rawData: JSON) {
         image_url = rawData["thumbnailUrl"].stringValue
         title     = rawData["title"].stringValue
     }
    2) Although this project seeks for just the "thumbnailUrl" and "title",
       I added the extra values incase we need the other data (i.e. if we need the id, etc.)
*/
