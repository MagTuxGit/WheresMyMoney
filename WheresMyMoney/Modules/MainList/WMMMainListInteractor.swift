//
//  WMMMainListInteractor.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

class WMMMainListInteractor: WMMMainListInteractorProtocol {
    
    private var dataSource: [String] = {
        return WMMList.allValues
    }()
    
    func numberOfRows(section: Int) -> Int {
        return dataSource.count
    }
    
    func titleForIndexPath(_ indexPath: IndexPath) -> String {
        return dataSource[indexPath.row]
    }
}
