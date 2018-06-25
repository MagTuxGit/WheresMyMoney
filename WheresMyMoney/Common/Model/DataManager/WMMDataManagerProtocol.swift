//
//  WMMDataManagerProtocol.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation
import CoreData

protocol WMMDataManagerProtocol {
}

extension WMMDataManagerProtocol {
    
    var dataManager: WMMDataManager {
        get {
            return WMMDataManager.shared
        }
    }
    
    //MARK: - Context
    var mainContext: NSManagedObjectContext {
        get {
            return dataManager.mainContext
        }
    }
    
    func getNewPrivateContext() -> NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = mainContext
        return context
    }

    func saveMainContext() {
        dataManager.saveMainContext()
    }
    
    //MARK: - Errors
    func printPersistError(_ error: NSError) {
        print("Could not persist \(error), \(error.userInfo)")
    }
    
    func printFetchError(_ error: NSError) {
        print("Could not fetch \(error), \(error.userInfo)")
    }
    
    func printDeleteError(_ error: NSError) {
        print("Could not delete \(error), \(error.userInfo)")
    }
}
