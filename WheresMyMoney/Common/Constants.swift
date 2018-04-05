//
//  Constants.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import Foundation

public enum MethodResult<T> {
    case success(T)
    case failure(String)
}

typealias MethodCompletion<T> = (MethodResult<T>)->()
