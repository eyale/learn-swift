//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        print("FILE PATH: \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.plistFileName))")
        
        loadItems()
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
//        deleteItem(indexPath.row)
        saveItems()
    }
    
    //MARK: - Add New Item Section
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField =  UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Todo", style: .cancel) { action in
            if let name = textField.text {

                let newItem = Item(context: self.context)
                newItem.name = name
                newItem.done = false
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
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }

        self.tableView.reloadData()

    }
    func loadItems()  {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error FETCHING data from context\(error)")
        }
    }
    func deleteItem(_ index: Int) {
        context.delete(itemArray[index])
        itemArray.remove(at: index)
        saveItems()
    }
}
