//
//  TrainPrograms+CoreDataProperties.swift
//  TrainPrograms
//
//  Created by Mac on 18.03.2021.
//
//

import Foundation
import CoreData


extension TrainPrograms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrainPrograms> {
        return NSFetchRequest<TrainPrograms>(entityName: "TrainPrograms")
    }

    @NSManaged public var programs: String?
    @NSManaged public var id: String?

}

extension TrainPrograms : Identifiable {

}
