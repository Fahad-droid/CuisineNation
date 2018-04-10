//
//  Border.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import Foundation
class Border {
    
    var country : Country
    var countryborder  : [Country]
    
    init(name: String, capital: String, latitude: Double, longitude: Double)
    {
        self.country = Country(name: name, capital: capital, latitude: latitude, longitude: longitude)
        countryborder  = []
    }
    
    init(country: Country){
        self.country = country
        countryborder  = []
    }
    
    func addBorder(country: Country){
        countryborder.append(country)
    }
    
    func addBorder(name: String, capital: String, latitude: Double, longitude: Double){
        countryborder.append(Country(name: name, capital: capital, latitude: latitude, longitude: longitude))
    }
}

