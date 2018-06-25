//
//  WMMDataManager.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

class WMMDataManager {
    static var shared = WMMDataManager()
    private init() {}
    
    let coreDataStack = WMMCoreDataStack()
    
    var mainContext: NSManagedObjectContext {
        get {
            return self.coreDataStack.context
        }
    }
    
    func saveMainContext() {
        self.coreDataStack.saveContext()
    }
    
    lazy var currency = { return WMMCurrencyDataManager() }()
    lazy var paymentMethod = { return WMMPaymentMethodDataManager() }()
}
