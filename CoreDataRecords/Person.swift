//
//  Person.swift
//  CoreDataRecords
//
//  Created by sunarc on 08/11/16.
//  Copyright © 2016 sunarc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Person: NSManagedObject {
    
    @NSManaged var name: String?
    @NSManaged var city: String?
    
}
