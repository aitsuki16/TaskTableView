//
//  ViewController.swift
//  TaskTableView
//
//  Created by Ai on 2020/06/14.
//  Copyright © 2020 Igarashi Ai. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storedData = UserDefaults.standard.data(forKey: "itemArray") {
            do {
                let decodedItems = try JSONDecoder().decode([Item].self, from: storedData)
                itemArray.append(contentsOf: decodedItems)
            } catch {
                print(error)
            }
        }
        
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
        var items = itemArray[indexPath.row]
        items.done = !items.done
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "item", message: "", preferredStyle: .alert )
        let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            if let textField = alert.textFields?.first {
                let itemData = Item(title: textField.text!, done: false)
                self.itemArray.insert(itemData , at: 0)
                
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
                
                let userDefaults = UserDefaults.standard
                do {
                    let archivedData: Data = try JSONEncoder().encode(self.itemArray)
                    userDefaults.set(archivedData, forKey: "itemArray")
                    userDefaults.synchronize()
                } catch {
                    print(error)
                }
            }
        }
        
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "NewItem"
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
}

