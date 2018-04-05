//
//  WMMAppDependencies.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

class WMMAppDependencies {
    var rootWireframe = WMMRootWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        self.rootWireframe.installRootViewControllerIntoWindow(window)
    }
    
    func configureDependencies() {
        
        //let dataManager = WMMDataManager.shared
        //moduleInteractor.dataManager = dataManager

        let currencyInteractor = WMMCurrencyListInteractor()
        let currencyWireframe = WMMCurrencyListWireframe(interactor: currencyInteractor)
        currencyWireframe.rootWireframe = self.rootWireframe
        
        // set wirefrmae dependencies
        
        rootWireframe.currencyWireframe = currencyWireframe
    }
}

