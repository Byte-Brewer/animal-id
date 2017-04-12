//
//  Coord+CoreDataProperties.swift
//  AnimalID
//
//  Created by Nazar on 12.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreData


extension Coord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coord> {
        return NSFetchRequest<Coord>(entityName: "Coord")
    }

    @NSManaged public var lat: Float
    @NSManaged public var long: Float
    @NSManaged public var time: Int32
    @NSManaged public var id: Int16

}
