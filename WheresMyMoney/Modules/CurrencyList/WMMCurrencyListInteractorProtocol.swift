//
//  WMMCurrencyListInteractorProtocol.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

protocol WMMCurrencyListInteractorProtocol {
    func numberOfRows(section: Int) -> Int
    func titleForIndexPath(_ indexPath: IndexPath) -> String
    func subtitleForIndexPath(_ indexPath: IndexPath) -> String
}
