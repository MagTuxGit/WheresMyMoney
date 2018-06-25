//
//  WMMLists.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

enum WMMList: String, CaseIterable {
    case currency = "Currencies"
    case paymentMethod = "Payment Methods"
    
    static var allValues: [String] {
        get {
            return WMMList.allCases.map { $0.rawValue }
        }
    }
}
