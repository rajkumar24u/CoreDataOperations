//
//  CoreDataOperations.swift
//  CoreDataRecords
//
//  Created by sunarc on 08/11/16.
//  Copyright © 2016 sunarc. All rights reserved.
//

import UIKit
import CoreData

class CoreDataOperations: NSObject {

    
    // MARK: Save data
    func saveData() -> Void {
        let managedObjectContext = getContext()
        let personData = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedObjectContext) as! Person
        personData.name = "Raj"
        personData.city = "Bikaner"
        
        do {
            try managedObjectContext.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
    }
    
    // MARK: Fetching Data
    func fetchData() -> Void {
        
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
            let fetchedPerson = try moc.fetch(fetchRequest) as! [Person]
            
            print(fetchedPerson.count)
            for object in fetchedPerson {
                print(object.name!)
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
    }
    
    
    
    // MARK: Delete Data Records
    
    func deleteRecords() -> Void {
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
         let result = try? moc.fetch(fetchRequest)
            let resultData = result as! [Person]
            
            for object in resultData {
                moc.delete(object)
            }
            
            do {
                try moc.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        
        
        
        
    }
    
    // MARK: Update Data
    func updateRecords() -> Void {
        let moc = getContext()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        let result = try? moc.fetch(fetchRequest)
            
            let resultData = result as! [Person]
            for object in resultData {
                object.name! = "\(object.name!) Joshi"
                print(object.name!)
            }
            do{
                try moc.save()
                print("saved")
            }catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
            
    
    }
    
    // MARK: Get Context
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

}
