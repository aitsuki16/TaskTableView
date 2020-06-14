//
//  ViewController.swift
//  TaskTableView
//
//  Created by Ai on 2020/06/14.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var itemArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1: Item = Item(title: "Study")
        let item2: Item = Item(title: "Cook")
        let item3: Item = Item(title: "Read book")
        
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)


        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
         let item = itemArray[indexPath.row]
               
         cell.textLabel?.text = item.title
         cell.accessoryType = item.done ? .checkmark: .none
               
         return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        item.done = !item.done
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "List", style: .default) { (action) in
        let newItem: Item = Item(title: textField.text!)
        self.itemArray.append(newItem)
        self.tableView.reloadData()
        }
        
       
    }
}

