//
//  WMMPaymentMethodDataManager.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

class WMMPaymentMethodDataManager: WMMDataManagerProtocol {
    
    @discardableResult
    func createPaymentMethod(_ paymentMethodDTO: WMMPaymentMethodDTO, inContext context: NSManagedObjectContext? = nil) -> WMMPaymentMethod {
        let context = context ?? mainContext
        
        let paymentMethod = WMMPaymentMethod.insertNewObject(into: context)
        paymentMethod.name = paymentMethodDTO.name
        paymentMethod.currency = paymentMethodDTO.currency.currency
        
        do { try context.save() } catch {
            print(error)
        }
        
        return paymentMethod
    }
    
    func getPaymentMethodList(inContext context: NSManagedObjectContext? = nil) -> [WMMPaymentMethod] {
        let context = context ?? mainContext
        
        let fetchRequest: NSFetchRequest<WMMPaymentMethod> = WMMPaymentMethod.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            printFetchError(error)
            return []
        }
    }
}
