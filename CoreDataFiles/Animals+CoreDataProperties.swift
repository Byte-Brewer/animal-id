//
//  Animals+CoreDataProperties.swift
//  AnimalID
//
//  Created by Nazar on 12.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreData


extension Animals {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animals> {
        return NSFetchRequest<Animals>(entityName: "Animals")
    }

    @NSManaged public var color_CD: String?
    @NSManaged public var nickname_CD: String?
    @NSManaged public var breed_CD: String?
    @NSManaged public var weight_CD: Int16
    @NSManaged public var lame_CD: Int16
    @NSManaged public var skinProblem_CD: Int16
    @NSManaged public var pregLact_CD: Int16
    @NSManaged public var owner_CD: Int16
    @NSManaged public var sterilization_CD: Int16
    @NSManaged public var baby_CD: Int16
    @NSManaged public var species_CD: Int16
    @NSManaged public var sex_CD: Int16
    @NSManaged public var lat_CD: Float
    @NSManaged public var long_CD: Float
    @NSManaged public var birthDate_CD: String?
    @NSManaged public var animalSize_CD: Int16
    @NSManaged public var shotDescrip_CD: String?
    @NSManaged public var createdAt_CD: String?
    @NSManaged public var img_CD: NSData?
    @NSManaged public var id_CD: Int16

}
