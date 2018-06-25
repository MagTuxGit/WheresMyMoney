//
//  WMMPaymentMethodListInteractorProtocol.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

protocol WMMPaymentMethodListInteractorProtocol {
    func numberOfRows(section: Int) -> Int
    func titleForIndexPath(_ indexPath: IndexPath) -> String
    func subtitleForIndexPath(_ indexPath: IndexPath) -> String
}
