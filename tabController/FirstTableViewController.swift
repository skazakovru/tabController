//
//  FirstTableViewController.swift
//  tabController
//
//  Created by Sergei Kazakov on 7/1/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//
import Foundation
import UIKit

class FirstTableViewController: UITableViewController {
 
     var names =  [Item]()
   
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Инструкция к автомобилю"
        names.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = " Сервисная книжка с отметками о продаже и печатями"
        names.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "ПТС (зеленая бумажка) с техническими данными автомобиля и печатями"
        names.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Договор Купли-Продажи (не менее 2-х экземпляров) с подписями продавца и покупателя и печатями автосалона"
        names.append(newItem4)
        
        loadItems()
    

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = names[indexPath.row].title
        
        //Ternary operator > value = condition ? valueIfTrue : valueIfFalse
        
        cell?.accessoryType = names[indexPath.row].done ? .checkmark : .none

        
//        if names[indexPath.row].done == true {
//            cell?.accessoryType = .checkmark
//        } else {
//            cell?.accessoryType = .none
//        }
        
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont (name: "Avenir Next", size: 16)
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Setting property of the selected item:
        
        names[indexPath.row].done = !names[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            names.remove(at: indexPath.row)
            saveItems()
            loadItems()
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Добавить пункт", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Добавить к списку", style: .default) { (action) in
            //what will happen once the user clicks on UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.names.append(newItem)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Впишите новый пункт"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(names)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            
            let decoder = PropertyListDecoder()
            do {
            names = try decoder.decode([Item].self, from: data)
            }  catch {
                print("Error decoding item array, \(error)")
            }
    }
    
        
    }

}

