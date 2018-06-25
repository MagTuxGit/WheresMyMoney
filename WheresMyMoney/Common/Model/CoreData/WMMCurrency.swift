//
//  WMMCurrency.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

extension WMMCurrency {
    
    var currencyDTO: WMMCurrencyDTO {
        get {
            return WMMCurrencyDTO(name: self.name ?? "", code: self.code, symbol: self.symbol, number: self.number?.intValue)
        }
    }
    
    static func insertNewObject(into context: NSManagedObjectContext) -> WMMCurrency {
        return NSEntityDescription.insertNewObject(forEntityName: "WMMCurrency", into: context) as! WMMCurrency
    }
    
}
