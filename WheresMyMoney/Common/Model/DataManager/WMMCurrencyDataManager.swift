//
//  WMMCurrencyDataManager.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

class WMMCurrencyDataManager {
    var dataManager = WMMDataManager.shared
    let context = WMMDataManager.shared.context
    
    @discardableResult
    func createCurrency(_ currencyDTO: WMMCurrencyDTO) -> WMMCurrency {
        let currency = WMMCurrency.insertNewObject(into: context)
        currency.name = currencyDTO.name
        currency.code = currencyDTO.code
        currency.number = currencyDTO.number?.number
        currency.symbol = currencyDTO.symbol
        
        dataManager.saveMainContext()
        
        return currency
    }
}

