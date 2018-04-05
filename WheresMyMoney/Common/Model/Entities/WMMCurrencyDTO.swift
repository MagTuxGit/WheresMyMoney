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
