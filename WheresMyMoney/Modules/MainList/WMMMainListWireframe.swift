//
//  WMMMainListWireframe.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

class WMMMainListWireframe {
    
    var rootWireframe: WMMRootWireframe?
    var currencyWireframe: WMMCurrencyListWireframe?
    var paymentMethodWireframe: WMMPaymentMethodListWireframe?

    var mainListInteractor: WMMMainListInteractorProtocol
    weak var mainListListViewController: WMMMainListViewController?
    
    init(interactor: WMMMainListInteractorProtocol) {
        self.mainListInteractor = interactor
    }
    
    func presentMainListScreen(isRoot: Bool) {
        let mainListVC = self.mainListListViewController ?? WMMMainListViewController.nibInstance
        mainListVC.mainListWireframe = self
        mainListVC.mainListInteractor = mainListInteractor
        mainListVC.title = "Main List"
        
        self.mainListListViewController = mainListVC
        if isRoot {
            self.rootWireframe?.showRootViewController(mainListVC)
        } else {
            self.rootWireframe?.pushViewController(mainListVC)
        }
    }
    
    func presentCurrencyScreen() {
        mainListListViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        currencyWireframe?.presentCurrencyScreen(isRoot: false)
    }
    
    func presentPaymentMethodScreen() {
        mainListListViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        paymentMethodWireframe?.presentPaymentMethodScreen(isRoot: false)
    }
}
