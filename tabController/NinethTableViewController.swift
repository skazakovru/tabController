//
//  NinethTableViewController.swift
//  tabController
//
//  Created by Sergei Kazakov on 7/1/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class NinethTableViewController: UITableViewController {
    
    var names =  [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Убедитесь в отсутствии повреждений/царапин на сидениях, обивке и панелях"
        names.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Сядьте в кресло водителя и отрегулируйте под себя кресло и руль"
        names.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Если МКПП: не заводя машину, проверьте ход педалей тормоза и сцепления,- педали не должны скрипеть/болтаться.Убедиться, что все передачи переключаются гладко, без усилий"
        names.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Если АКП: не заводя машину, проверяем только ход педали тормоза"
        names.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "Не заводя двигатель, включить зажигание: убедиться, что лампы панели работают. Подвигать рулем вправо-влево до начала движения колес и убедиться в отсутствии стуков"
        names.append(newItem5)
        
        let newItem6 = Item()
        newItem6.title = "Запустить двигатель: убедитесь в легкости запуска без посторонних шумов, в ровной работе двигателя после запуска и в отсутсвии скачков по стрелке тахометра"
        names.append(newItem6)
        
        let newItem7 = Item()
        newItem7.title = "Проверьте работу: кондиционера/климат-контроля на максимальную температуру прогрева и минимальную охлаждения"
        names.append(newItem7)
        
        let newItem8 = Item()
        newItem8.title = "Проверьте регулировку и складывания зеркал, электростеклоподъемников каждой двери в отдельности"
        names.append(newItem8)
        
        let newItem9 = Item()
        newItem9.title = "работу всех внутренних систем: парктроников, камер, магнитолы, включение света в салоне, свободный ход ремней безопасности и т.д."
        names.append(newItem9)
        
        let newItem10 = Item()
        newItem10.title = "Выйдите из машины и посадите менеджера на водительское место: попросите его поочередно включить: аварийную сигнализацию, поворотники, ближний/дальний свет, габариты, стопы, задние и передние противотуманные фары"
        names.append(newItem10)
        
        let newItem11 = Item()
        newItem11.title = "Если при проверке обнаружены серьезные дефекты, - откажитесь от покупки, или требуйте дополнительной скидки"
        names.append(newItem11)
        
        loadItems()
    }

    // MARK: - Table view data source
//
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
        cell?.textLabel?.font = UIFont (name: "Avenir Next", size: 12)
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
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
}
}
