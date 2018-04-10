//
//  Item.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import Foundation
class Item: Equatable {
    let name: String
    let aname:String
    let loc:String
    let num:Double
    
    init(name:String, aname:String, loc:String, num:Double) {
        self.name = name
        self.aname = aname
        self.loc = loc
        self.num = num
    }
    
}

func ==(first: Item, second: Item) -> Bool {
    return
        (first.name == second.name &&
            first.num == second.num  &&
            first.loc == second.loc  &&
            first.aname == second.aname)
}


