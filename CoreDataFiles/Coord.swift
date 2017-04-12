//
//  Coord+CoreDataClass.swift
//  AnimalID
//
//  Created by Nazar on 12.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreData

@objc(Coord)
public class Coord: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Coord"), insertInto: CoreDataManager.instance.managedObjectContext)
    }


}
