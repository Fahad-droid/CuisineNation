//
//  Dish.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import Foundation
class Guard {
    let sname:String
    let aname:String
    let loc:String
    let num:Int
    let items:Array<Item>
    
    init(sname:String, aname:String,loc:String,num:Int,items:Array<Item> = []) {
        self.sname = sname
        self.aname = aname
        self.loc = loc
        self.num=num
        self.items = items
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.num
        }
        return total
    }
    func mealDetails()-> String {
        var message = "Cuisine: \(self.aname)\nCountry: \(self.loc)\nCalories: \(self.num)"
        for item in self.items {
            message += "\n \(item.name) - calories: \(item.num)"
        }
        return message
    }
    
    
}
