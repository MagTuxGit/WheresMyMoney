//
//  WMMPaymentMethodListInteractor.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMPaymentMethodListInteractor: WMMPaymentMethodListInteractorProtocol {
    
    // Fake data for testing
    private var dataSource: [WMMPaymentMethodDTO] = {
        var paymentMethods = [WMMPaymentMethodDTO]()
        paymentMethods.append(WMMPaymentMethodDTO(name: "Cash", currency: WMMCurrencyDTO.uah))
        paymentMethods.append(WMMPaymentMethodDTO(name: "Card Privat", currency: WMMCurrencyDTO.uah))
        paymentMethods.append(WMMPaymentMethodDTO(name: "Account USD", currency: WMMCurrencyDTO.usd))
        return paymentMethods
    }()
    
    func numberOfRows(section: Int) -> Int {
        return dataSource.count
    }
    
    func titleForIndexPath(_ indexPath: IndexPath) -> String {
        return dataSource[indexPath.row].name
    }
    
    func subtitleForIndexPath(_ indexPath: IndexPath) -> String {
        return dataSource[indexPath.row].currency.code ?? "N/A"
    }
}
