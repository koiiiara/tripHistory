//
//  Money.swift
//  Place
//
//  Created by Илья Миронов on 28/08/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//

import Foundation

enum TypeOfCurrency: String {
    case dollar = "USD"
    case euro = "EUR"
    case ruble = "RUB"
}

//struct Money {
//    let currency: TypeOfCurrency
//    let amount: Double
//}
//
//extension Money: CustomStringConvertible {
//    var description: String {
//        let currencyCode = currency.rawValue
//        let locale = NSLocale(localeIdentifier: currencyCode)
//        let currencySymbol = locale.displayName(forKey: .currencySymbol, value: currencyCode) ?? currencyCode
//        return "\(amount) \(currencySymbol)"
//    }
//}
