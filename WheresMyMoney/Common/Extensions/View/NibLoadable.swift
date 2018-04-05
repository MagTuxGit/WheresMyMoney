//
//  NibLoadable.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

protocol NibLoadable {
}

extension NibLoadable where Self: UIViewController {
    static var nibInstance: Self {
        get {
            return Self(nibName: String(describing: Self.self), bundle: nil)
        }
    }
}
