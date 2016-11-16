//
//  ViewController.swift
//  CoreDataRecords
//
//  Created by sunarc on 08/11/16.
//  Copyright © 2016 sunarc. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    let coredataOperations = CoreDataOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
// MARK: IBOutlets Connections
    
    @IBAction func saveRecords(_ sender: UIButton) {
      coredataOperations.saveData()
    }
    @IBAction func fetchDataRecords(_ sender: UIButton) {
        coredataOperations.fetchData()
    }
    @IBAction func updateDataRecords(_ sender: UIButton) {
        coredataOperations.updateRecords()
    }
    @IBAction func deletedataRecords(_ sender: UIButton) {
        coredataOperations.deleteRecords()
    }
    
}

