//
//  WorkWithData.swift
//  AnimalID
//
//  Created by Nazar on 12.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreData

class WorkWithCoreData {
    
    func getDataAnimal() {
        // Извление записей
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Animals")
        do {
            let results = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest)
            print(results.count)
            for result in results as! [Animals] {
                
                let animalSize = Int(result.animalSize_CD)
                let baby = Int(result.baby_CD)
                let birthDate = result.birthDate_CD
                let breed = result.breed_CD
                let color = result.color_CD
                let createdAt = result.createdAt_CD
                var img: Data?
                if let foto = result.img_CD {
                    img = foto as! Data
                }
                let lame = result.lame_CD
                let lat = result.lat_CD
                let long = result.long_CD
                let nickName = result.nickname_CD
                let owner = result.owner_CD
                let pregLact = result.pregLact_CD
                let sex = result.sex_CD
                let shortDescrip = result.shotDescrip_CD
                let skinProblem = result.skinProblem_CD
                let species = result.species_CD
                let sterilizacion = result.sterilization_CD
                let weight = result.weight_CD
                
                // MARK: - викличи финкцію яка передає данні на сервак
                
                print(animalSize, baby, birthDate ?? "00000000", breed ?? "00000000", color ?? "00000000", createdAt ?? nil, img, lame, lat, long, nickName ?? nil, owner, pregLact, sex, shortDescrip ?? "00000000", skinProblem, species, sterilizacion, weight)
                print("getDataAnimals")
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
                let id = result.id
                print(lat, long, time, "Lat, Long, Time", Date(timeIntervalSince1970: TimeInterval(time)), ",", id)
                // MARK: - видалення результату кожного
               //  CoreDataManager.instance.managedObjectContext.delete(result)
                if id == 22 {
                    print("id  == 22")
                    // MARK: -  видалення за умови
                    // CoreDataManager.instance.managedObjectContext.delete(result)
                    // print("remove there is id == 22 ")
                }
            }
            // MARK: - видалення останньої
            // CoreDataManager.instance.managedObjectContext.delete(results.last as! NSManagedObject)
            // print("remove Last Again")
            CoreDataManager.instance.saveContext()
        } catch {
            print(error)
        }
    }
    
    func setDataCoord(lat: Float, long: Float) {
        let timeNow = NSDate()
        print(timeNow)
        let managedObject = Coord()
        managedObject.lat = lat
        managedObject.long = long
        managedObject.time = Int32(timeNow.timeIntervalSince1970)
        print("Read time from data coord" , NSDate(timeIntervalSince1970: TimeInterval(managedObject.time)))
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
