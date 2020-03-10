//
//  Place+CoreDataProperties.swift
//  Place
//
//  Created by Илья Миронов on 22/09/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var comment: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var rate: Int16
    @NSManaged public var transport: Int16
    @NSManaged public var cost: Money?
    @NSManaged public var trip: Trip?
    
    
}
