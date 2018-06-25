//
//  WMMPaymentMethodDTO.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMPaymentMethodDTO {
    var name: String
    var currency: WMMCurrencyDTO
    
    init(name: String, currency: WMMCurrencyDTO) {
        self.name = name
        self.currency = currency
    }
}
