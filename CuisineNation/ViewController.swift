//
//  ViewController.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var sname: UITextField!
    @IBOutlet weak var agname: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var tnum: UITextField!
    
    var delegate : GuardViewController?
    
    var items =
        [
            Item(name: "Ankit", aname:"Paragon", loc:"Richmind Hill", num:789091),
            Item(name: "Vishal", aname:"Onyx", loc:"Markham",num:789092),
            Item(name: "Ravi", aname:"Primary", loc:"Richmind Hill",num:890761)
    ]
    var selected = Array<Item>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) { /* if not null */
            
            if (cell.accessoryType == UITableViewCellAccessoryType.none) { /* if not checked */
                
                cell.accessoryType = UITableViewCellAccessoryType.checkmark /* checked */
                
                let item = items[indexPath.row]
                selected.append(item)
                
            } else {
                
                cell.accessoryType = UITableViewCellAccessoryType.none /* remove any mark */
                
                let item = items[indexPath.row]
                if let position = selected.index(of: item) {
                    selected.remove(at: position)
                }
                
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
        
    }
    
    
    
    @IBAction func addGuard(_ sender: UIButton) {
        if (sname == nil || agname == nil || location == nil || tnum==nil)
        {
            return
        }
        
        let name : String = sname!.text!
        let aname : String = agname!.text!
        let loc : String = location!.text!
        if let num = Int(tnum!.text!)
        {
            let meal = Guard (sname: name, aname: aname, loc:loc, num:num, items: selected)
            
            print("---------- OUTPUT ----------")
            print("Dish name: \(meal.sname)")
            print("Calories:  \(meal.num)")
            print("Cuisine:   \(meal.aname)")
            print("Country:   \(meal.loc)")
            print("----------------------------")
            
            
            /* variable that support our back and forth
             navigation */
            
            if (delegate == nil) {
                return
            }
            
            delegate!.addMealsTable(meal)
            
        }
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
        
        
    }
    
}


