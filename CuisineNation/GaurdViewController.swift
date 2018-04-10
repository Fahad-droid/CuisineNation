//
//  GaurdViewController.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//

import UIKit

class GuardViewController: UITableViewController,AddDishDelegate  {
    
    @IBOutlet var tview: UITableView!
    var meals = [Guard(sname:"Spaghetti Pasta", aname:"Italian", loc:"Italy",num: 375),
                 Guard(sname:"Poutine", aname:"Canadian", loc:"Canada",num: 700),
                 Guard(sname:"Tandoori Chicken", aname:"Indian", loc:"India",num: 300),
                 Guard(sname:"Sushi", aname:"Japanese", loc:"Japan",num: 150),
                 Guard(sname:"Guacamole", aname:"Mexican", loc:"Mexico",num: 225),
                 Guard(sname:"Churrasco", aname:"Brazilian", loc:"Brazil",num: 750)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.sname
        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                                               action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
        
    }
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        
        if (recognizer.state == UIGestureRecognizerState.began) {
            
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                /* Adding a Modal Alert to show on the screen the content that I am pressing */
                let details = UIAlertController(title: meal.sname, message: meal.mealDetails(), preferredStyle: UIAlertControllerStyle.alert)
                
                /* Creating a button to release the modal mode after user interaction */
                let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                
                /* Adding the button in Modal alert  */
                details.addAction(cancel)
                present(details, animated: true, completion: nil)
            }
        }
    }
    
    func addMealsTable(_ meal:Guard){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender : Any?) {
        if (segue.identifier == "addGuard") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
        if (segue.identifier == "searchLocation") {
            let view1 = segue.destination as! LocationViewController
            view1.delegate = self
        }
        
    }
    
    
}
