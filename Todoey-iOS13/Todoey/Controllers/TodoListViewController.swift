//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [ToDoItemModel]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.plistFileName)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataFilePath)
        
        let newToDoItem = ToDoItemModel()
        newToDoItem.name = "a1"
        
        itemArray.append(newToDoItem)
        //        if let items = defaults.array(forKey: K.defaultsArrayName) as? [ToDoItemModel] {
        //            itemArray = items
        //        }
    }
    
    //MARK: - UITableViewDataSource - responsible to populating the TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.name
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        saveItems()
    }
    
    //MARK: - Add New Item Section
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField =  UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Todo", style: .cancel) { action in
            if let name = textField.text {
                let newItem = ToDoItemModel()
                newItem.name = name
                self.itemArray.append(newItem)
                self.saveItems()
            }
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Type here new ToDo item Name"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func saveItems() {
        let encoder = PropertyListEncoder()

        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
            self.tableView.reloadData()
        } catch {
            print("Error encodig itemArray \(error)")
        }
    }
}
