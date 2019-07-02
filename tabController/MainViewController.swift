//
//  MainViewController.swift
//  tabController
//
//  Created by Sergei Kazakov on 6/29/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
    }
    
   
    
    @IBAction func docTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "segue1", sender: self)

    }
    @IBAction func markTapped(_ sender: Any) {
             performSegue(withIdentifier: "segue2", sender: self)
    }
    
    @IBAction func complectTapped(_ sender: Any) {
   performSegue(withIdentifier: "segue3", sender: self)
    }
    
    @IBAction func auxilaryTapped(_ sender: Any) {
   performSegue(withIdentifier: "segue4", sender: self)
    }
    
    @IBAction func externalTapped(_ sender: Any) {
   performSegue(withIdentifier: "segue5", sender: self)
    }
    
    @IBAction func wheelsTapped(_ sender: Any) {
           performSegue(withIdentifier: "segue6", sender: self)
    }
    
    @IBAction func bodyTapped(_ sender: Any) {
           performSegue(withIdentifier: "segue7", sender: self)
        
    }
    
    @IBAction func underHoodTapped(_ sender: Any) {
           performSegue(withIdentifier: "segue8", sender: self)
    }
    
    @IBAction func fromInsideTapped(_ sender: Any) {
           performSegue(withIdentifier: "segue9", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
