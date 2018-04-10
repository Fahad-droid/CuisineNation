//
//  Country.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import Foundation
class Country {
    public private(set) var countryName    : String
    public private(set) var countrycapital : String
    public private(set) var latitude       : Double
    public private(set) var longitude      : Double
    
    init(name: String, capital: String, latitude: Double, longitude: Double){
        self.countryName = name
        self.countrycapital = capital
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
