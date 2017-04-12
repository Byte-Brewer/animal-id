//
//  WorkWithData.swift
//  AnimalID
//
//  Created by Nazar on 12.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class WorkWithCoreData {
    
    let time = NSDate()
    let foto = UIImage(named: "horse")
    var myImage: UIImage?
    
    func getDataAnimal() {
        // Извление записей
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Animals")
        do {
            let results = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest)
            print(results.count)
            for result in results as! [Animals] {
                if result.nickname_CD == "Horse" {
                    print("CUCYK")
                    if let fotoData = result.img_CD {
                        if let foto = UIImage(data: fotoData as Data) {
                            myImage = foto
                        }
                    }
                }
                print(result.createdAt_CD ?? "were is createdAt_CD")
                //                print("nik - \(result.nik)")
                //                print("sex - \(result.sex)")
                //                print("Time :  \(result.regTime)")
                //                print("Foto: \(result.foto)")
            }
        } catch {
            print(error)
        }
    }
    
    func getDataCoord() {
        // Извление записей
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coord")
        do {
            let results = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest)
            print(results.count)
            for result in results as! [Coord] {
                let lat = result.lat
                let long = result.long
                let time = result.time
                print(lat, long, time, "were is createdAt_CD")
            }
        } catch {
            print(error)
        }
    }
    
    func setDataCoord(lat: Float, long: Float) {
        let timeNow = NSDate()
        print(timeNow)
        print(timeNow.timeIntervalSince1970)
        let managedObject = Coord()
        managedObject.lat = lat
        managedObject.long = long
        managedObject.time = Int32(timeNow.timeIntervalSince1970)
        print("Read time from data coord" ,managedObject.time)
        CoreDataManager.instance.saveContext()
        
    }
    
    func setDataAnimal(animalSize: Int?,
                       baby: Int?,
                       birthDate: String?,
                       breed: String?,
                       color: String?,
                       createdAt: String?,
                       img: Data?,
                       lame: Int?,
                       lat: Float?,
                       long: Float?,
                       nickName: String?,
                       owner: Int?,
                       pregLact: Int?,
                       sex: Int?,
                       shotDescrip: String?,
                       skinProblem: Int?,
                       species: Int?,
                       sterilizacion: Int?,
                       weight: Int?) {
        let managedObject = Animals()
        
        // Установка значения атрибута
        if let fotoData = img {
            managedObject.img_CD = fotoData as NSData //UIImageJPEGRepresentation(foto!, 1)
        }
        if let size = animalSize {
            managedObject.animalSize_CD = Int16(size)
        }
        if let babyTemp = baby {
            managedObject.baby_CD = Int16(babyTemp)
        }
        if let lameTemp = lame {
            managedObject.lame_CD = Int16(lameTemp)
        }
        if let sexTemp = sex {
            managedObject.sex_CD = Int16(sexTemp)
        }
        if let preg = pregLact {
            managedObject.pregLact_CD = Int16(preg)
        }
        if let ownerTemp = owner {
            managedObject.owner_CD = Int16(ownerTemp)
        }
        if let scin = skinProblem {
            managedObject.skinProblem_CD = Int16(scin)
        }
        if let spec = species {
            managedObject.species_CD = Int16(spec)
        }
        if let ster = sterilizacion {
            managedObject.sterilization_CD = Int16(ster)
        }
        if let weightTemp = weight {
            managedObject.weight_CD = Int16(weightTemp)
        }
        if let longTemp = long {
            managedObject.long_CD = longTemp
        }
        if let latTemp = lat {
            managedObject.lat_CD = latTemp
        }
        managedObject.nickname_CD = nickName
        managedObject.birthDate_CD = birthDate
        managedObject.createdAt_CD = createdAt
        managedObject.breed_CD = breed
        managedObject.color_CD = color
        managedObject.shotDescrip_CD = shotDescrip

        // Извлечение значения атрибута
        let nik = managedObject.nickname_CD
        print("name = \(String(describing: nik))")
        //  print(foto)
        
        // Запись объекта
        CoreDataManager.instance.saveContext()
        
    }
    
    
}
