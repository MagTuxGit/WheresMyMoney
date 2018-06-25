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

        let mainListInteractor = WMMMainListInteractor()
        let mainListWireframe = WMMMainListWireframe(interactor: mainListInteractor)
        mainListWireframe.rootWireframe = self.rootWireframe

        let currencyInteractor = WMMCurrencyListInteractor()
        let currencyWireframe = WMMCurrencyListWireframe(interactor: currencyInteractor)
        currencyWireframe.rootWireframe = self.rootWireframe
        
        let paymentMethodInteractor = WMMPaymentMethodListInteractor()
        let paymentMethodWireframe = WMMPaymentMethodListWireframe(interactor: paymentMethodInteractor)
        paymentMethodWireframe.rootWireframe = self.rootWireframe

        // set wireframe dependencies
        rootWireframe.mainListWireframe = mainListWireframe
        mainListWireframe.currencyWireframe = currencyWireframe
        mainListWireframe.paymentMethodWireframe = paymentMethodWireframe
    }
}

