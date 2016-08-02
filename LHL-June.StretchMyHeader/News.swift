//
//  News.swift
//  LHL-June.StretchMyHeader
//
//  Created by Asuka Nakagawa on 2016-08-02.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

import UIKit

class News: NSObject {

    // Properties
    var category: String
    var headline: String
    
    init? (category: String, headline: String) {
        self.category = category
        self.headline = headline
    }
}
