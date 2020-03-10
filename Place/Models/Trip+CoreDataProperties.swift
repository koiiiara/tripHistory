//
//  Trip+CoreDataProperties.swift
//  Place
//
//  Created by Илья Миронов on 22/09/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var comment: String?
    @NSManaged public var name: String?
    @NSManaged public var places: NSSet?

}

// MARK: Generated accessors for places
extension Trip {

    @objc(addPlacesObject:)
    @NSManaged public func addToPlaces(_ value: Place)

    @objc(removePlacesObject:)
    @NSManaged public func removeFromPlaces(_ value: Place)

    @objc(addPlaces:)
    @NSManaged public func addToPlaces(_ values: NSSet)

    @objc(removePlaces:)
    @NSManaged public func removeFromPlaces(_ values: NSSet)

}
