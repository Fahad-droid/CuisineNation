//
//  Alert.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import Foundation
import UIKit
class Alert {
    
    let controller : UIViewController /* Created due present belongs to UIViewController */
    
    init(controller:UIViewController) {
        
        self.controller = controller
        
    }
    
    func show(_ title : String = "Sorry", message : String = "Unexpected Error") {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
        
    }
    
    
}
