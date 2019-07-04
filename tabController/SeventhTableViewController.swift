//
//  SeventhTableViewController.swift
//  tabController
//
//  Created by Sergei Kazakov on 7/1/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//
import Foundation
import UIKit

class SeventhTableViewController: UITableViewController {
    
    var names =  [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Измерить толщиномером каждую деталь кузова - разница не должна превышать 100 микрон!"
        names.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Открыть двери, капот и багажник и убедитесь, что все петли и болты не имеют следов демонтажа"
        names.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Багажник: убедиться в отсутствии повреждений металла в месте крепления запаски/докатки"
        names.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Под капотом: убедиться в отсутствии повреждений передней панели радиатора и ребер жесткости слева и справа от двигателя"
        names.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "Пороги: убедитесь в отсутсвии царапин и потертостей"
        names.append(newItem5)
        
        let newItem6 = Item()
        newItem6.title = "Стекла: проверить маркировку на совпадение года выпуска всех стекол и отсутствие повреждений"
        names.append(newItem6)
        
        loadItems()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = names [indexPath.row].title
        
        cell?.accessoryType = names[indexPath.row].done ? .checkmark : .none
        
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont (name: "Avenir Next", size: 14)
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
