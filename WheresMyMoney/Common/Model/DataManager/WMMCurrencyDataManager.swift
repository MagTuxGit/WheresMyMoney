//
//  WMMCurrencyDataManager.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

class WMMCurrencyDataManager: WMMDataManagerProtocol {
    
    func defaultCurrency(inContext context: NSManagedObjectContext? = nil) -> WMMCurrency {
        let context = context ?? mainContext

        let defaultCurrencyCode = "UAH"
        
        if let currency = self.getCurrency(code: defaultCurrencyCode, inContext: context) {
            return currency
        }
        
        let uahCurrencyDTO = WMMCurrencyDTO(name: "Ukrainian Hryvnia", code: "UAH")
        return self.createCurrency(uahCurrencyDTO, inContext: context)
    }

    @discardableResult
    func createCurrency(_ currencyDTO: WMMCurrencyDTO, inContext context: NSManagedObjectContext? = nil) -> WMMCurrency {
        let context = context ?? mainContext

        let currency = WMMCurrency.insertNewObject(into: context)
        currency.name = currencyDTO.name
        currency.code = currencyDTO.code
        currency.number = currencyDTO.number?.number
        currency.symbol = currencyDTO.symbol
        
        saveMainContext()
        
        return currency
    }
    
    func getCurrency(code: String, inContext context: NSManagedObjectContext? = nil) -> WMMCurrency? {
        let context = context ?? mainContext
        
        let fetchRequest: NSFetchRequest<WMMCurrency> = WMMCurrency.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%k == %@", #keyPath(WMMCurrency.code), code)
        do {
            let currencies = try context.fetch(fetchRequest)
            return currencies.last
        } catch let error as NSError {
            printFetchError(error)
            return nil
        }
    }
}
