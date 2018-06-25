//
//  WMMCurrencyListInteractor.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMCurrencyListInteractor: WMMCurrencyListInteractorProtocol {
    
    private var dataSource: [WMMCurrencyDTO] = {
        var currencyDataManager = WMMDataManager.shared.currency
        var currencies = currencyDataManager.getCurrencyList().map { $0.currencyDTO }
        if currencies.isEmpty {
            currencies = defaultDataSource
            currencyDataManager.createCurrencies(currencies)
        }
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

extension WMMCurrencyListInteractor {

    static var defaultDataSource: [WMMCurrencyDTO] {
        get {
            var currencies = [WMMCurrencyDTO]()
            currencies.append(WMMCurrencyDTO.usd)
            currencies.append(WMMCurrencyDTO.eur)
            currencies.append(WMMCurrencyDTO.gbp)
            currencies.append(WMMCurrencyDTO.uah)
            currencies.append(WMMCurrencyDTO.rub)
            return currencies
        }
    }
}
