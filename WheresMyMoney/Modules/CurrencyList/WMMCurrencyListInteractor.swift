//
//  WMMCurrencyListInteractor.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMCurrencyListInteractor: WMMCurrencyListInteractorProtocol {
    
    private var currencyDataManager = WMMDataManager.shared.currency
    
    // Fake data for testing
    private var dataSource: [WMMCurrencyDTO] = {
        var currencies = [WMMCurrencyDTO]()
        currencies.append(WMMCurrencyDTO(name: "US Dollar", code: "USD"))
        currencies.append(WMMCurrencyDTO(name: "Euro", code: "EUR"))
        currencies.append(WMMCurrencyDTO(name: "British Pound", code: "GBP"))
        currencies.append(WMMCurrencyDTO(name: "Ukrainian Hryvnia", code: "UAH"))
        currencies.append(WMMCurrencyDTO(name: "Russian Ruble", code: "RUB"))
        return currencies
    }()
    
    func numberOfRows(section: Int) -> Int {
        return dataSource.count
    }
    
    func titleForIndexPath(_ indexPath: IndexPath) -> String {
        return dataSource[indexPath.row].name
    }
    
    func subtitleForIndexPath(_ indexPath: IndexPath) -> String {
        return dataSource[indexPath.row].code ?? ""
    }
}
