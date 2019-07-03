//
//  NinethTableViewController.swift
//  tabController
//
//  Created by Sergei Kazakov on 7/1/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class NinethTableViewController: UITableViewController {
    
      var names = ["Убедитесь в отсутствии повреждений/царапин на сидениях, обивке и панелях","Сядьте в кресло водителя и отрегулируйте под себя кресло и руль","Если МКПП: не заводя машину, проверьте ход педалей тормоза и сцепления,- педали не должны скрипеть/болтаться.Убедиться, что все передачи переключаются гладко, без усилий","Если АКП: не заводя машину, проверяем только ход педали тормоза","Не заводя двигатель, включить зажигание: убедиться, что лампы панели работают. Подвигать рулем вправо-влево до начала движения колес и убедиться в отсутствии стуков","Запустить двигатель: убедитесь в легкости запуска без посторонних шумов, в ровной работе двигателя после запуска и в отсутсвии скачков по стрелке тахометра ","Проверьте работу: кондиционера/климат-контроля на максимальную температуру прогрева и минимальную охлаждения","регулировку и складывания зеркал, электростеклоподъемников каждой двери в отдельности","работу всех внутренних систем: парктроников, камер, магнитолы, включение света в салоне, свободный ход ремней безопасности и т.д.","Выйдите из машины и посадите менеджера на водительское место: попросите его поочередно включить: аварийную сигнализацию, поворотники, ближний/дальний свет, габариты, стопы, задние и передние противотуманные фары","Если при проверке обнаружены серьезные дефекты, - откажитесь от покупки, или требуйте дополнительной скидки"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        
        cell?.textLabel?.text = names [indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont (name: "Avenir Next", size: 12)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
