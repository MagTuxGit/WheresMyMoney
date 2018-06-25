//
//  WMMPaymentMethod.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

extension WMMPaymentMethod {
    
    var paymentMethodDTO: WMMPaymentMethodDTO {
        get {
            let currencyDTO = self.currency?.currencyDTO ?? WMMCurrencyDTO(name: "Unknown")
            return WMMPaymentMethodDTO(name: self.name ?? "", currency: currencyDTO)
        }
    }
    
    static func insertNewObject(into context: NSManagedObjectContext) -> WMMPaymentMethod {
        return NSEntityDescription.insertNewObject(forEntityName: "WMMPaymentMethod", into: context) as! WMMPaymentMethod
    }
    
}
