//
//  WMMCurrencyDTO.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMCurrencyDTO {
    var name: String
    var code: String?
    var symbol: String?
    var number: Int?
    
    init(name: String, code: String? = nil, symbol: String? = nil, number: Int? = nil) {
        self.name = name
        self.code = code
        self.symbol = symbol
        self.number = number
    }
}

extension WMMCurrencyDTO {
    static var uah: WMMCurrencyDTO {
        get { return WMMCurrencyDTO(name: "Ukrainian Hryvnia", code: "UAH") }
    }
    
    static var usd: WMMCurrencyDTO {
        get { return WMMCurrencyDTO(name: "US Dollar", code: "USD") }
    }

    static var eur: WMMCurrencyDTO {
        get { return WMMCurrencyDTO(name: "Euro", code: "EUR") }
    }
    
    static var rub: WMMCurrencyDTO {
        get { return WMMCurrencyDTO(name: "Russian Ruble", code: "RUB") }
    }
    
    static var gbp: WMMCurrencyDTO {
        get { return WMMCurrencyDTO(name: "British Pound", code: "GBP") }
    }
}
