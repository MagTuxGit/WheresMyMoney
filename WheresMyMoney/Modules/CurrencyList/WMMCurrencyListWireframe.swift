//
//  WMMCurrencyListWireframe.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

class WMMCurrencyListWireframe {
    
    var rootWireframe: WMMRootWireframe?
    var currencyInteractor: WMMCurrencyListInteractorProtocol
    weak var currencyListViewController: WMMCurrencyListViewController?
    
    init(interactor: WMMCurrencyListInteractorProtocol) {
        self.currencyInteractor = interactor
    }
    
    func presentCurrencyScreen() {
        let currencyVC = self.currencyListViewController ?? WMMCurrencyListViewController.nibInstance
        currencyVC.currencyWireframe = self
        currencyVC.currencyInteractor = currencyInteractor
        currencyVC.title = "Currency List"
        
        self.currencyListViewController = currencyVC
        self.rootWireframe?.showRootViewController(currencyVC)
    }
    
}
