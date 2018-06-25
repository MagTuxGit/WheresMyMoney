//
//  WMMMainListInteractorProtocol.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

protocol WMMMainListInteractorProtocol {
    func numberOfRows(section: Int) -> Int
    func titleForIndexPath(_ indexPath: IndexPath) -> String
}
