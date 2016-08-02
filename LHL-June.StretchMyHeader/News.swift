//
//  News.swift
//  LHL-June.StretchMyHeader
//
//  Created by Asuka Nakagawa on 2016-08-02.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

import UIKit

// struct: it comes with the initializer automatically
struct News {
    let category: Category
    let headline: String
    
    
    
    // Key:enum Value:String(rawValue)
    enum Category: String {
        case World = "World"
        case Americas = "Americas"
        case Europe = "Europe"
        case MiddleEast = "Middle East"
        case Africa = "Africa"
        case AsiaPacific = "Asia Pacific"
        
        // self = colorForCategory
        func color() -> UIColor {
            switch self {
            case .World:
                return UIColor.redColor()
            case .Americas:
                return UIColor.blueColor()
            case .Europe:
                return UIColor.greenColor()
            case .MiddleEast:
                return UIColor.yellowColor()
            case .Africa:
                return UIColor.orangeColor()
            default:
                return UIColor.purpleColor()
            }
        }
    }
}

//item.colorForCategory()
//item.category.color()


