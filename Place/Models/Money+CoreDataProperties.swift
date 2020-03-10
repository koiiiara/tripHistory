//
//  Money+CoreDataProperties.swift
//  Place
//
//  Created by Илья Миронов on 22/09/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//
//

import Foundation
import CoreData


extension Money {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Money> {
        return NSFetchRequest<Money>(entityName: "Money")
    }

    @NSManaged public var amount: Double
    @NSManaged public var currency: String?
    var typeOfCurrency: TypeOfCurrency {
        get {
            return TypeOfCurrency(rawValue: self.currency!)!
        }
        set {
            self.currency = newValue.rawValue
        }
    }


}

