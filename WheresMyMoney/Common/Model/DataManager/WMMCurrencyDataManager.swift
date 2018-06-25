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
        return self.getCurrency(code: "UAH", inContext: context) ?? self.createCurrency(WMMCurrencyDTO.uah, inContext: context)
    }

    func createCurrencies(_ currencies: [WMMCurrencyDTO], inContext context: NSManagedObjectContext? = nil) {
        for currency in currencies {
            self.createCurrency(currency, inContext: context)
        }
    }

    @discardableResult
    func createCurrency(_ currencyDTO: WMMCurrencyDTO, inContext context: NSManagedObjectContext? = nil) -> WMMCurrency {
        let context = context ?? mainContext

        let currency = WMMCurrency.insertNewObject(into: context)
        currency.name = currencyDTO.name
        currency.code = currencyDTO.code
        currency.number = currencyDTO.number?.number
        currency.symbol = currencyDTO.symbol
        
        do { try context.save() } catch {
            print(error)
        }
        
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

    func getCurrencyList(inContext context: NSManagedObjectContext? = nil) -> [WMMCurrency] {
        let context = context ?? mainContext
        
        let fetchRequest: NSFetchRequest<WMMCurrency> = WMMCurrency.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            printFetchError(error)
            return []
        }
    }
}

extension WMMCurrencyDTO {
    
    var currency: WMMCurrency? {
        get {
            guard let currencyCode = self.code else { return nil }
            let currencyDataManager = WMMDataManager.shared.currency
            return currencyDataManager.getCurrency(code: currencyCode) ?? currencyDataManager.createCurrency(self)
        }
    }
}
