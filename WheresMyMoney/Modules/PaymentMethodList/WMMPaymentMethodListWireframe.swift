//
//  WMMPaymentMethodListWireframe.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

class WMMPaymentMethodListWireframe {
    
    var rootWireframe: WMMRootWireframe?
    var paymentMethodListInteractor: WMMPaymentMethodListInteractorProtocol
    weak var paymentMethodListViewController: WMMPaymentMethodListViewController?
    
    init(interactor: WMMPaymentMethodListInteractorProtocol) {
        self.paymentMethodListInteractor = interactor
    }
    
    func presentPaymentMethodScreen(isRoot: Bool) {
        let paymentMethodVC = self.paymentMethodListViewController ?? WMMPaymentMethodListViewController.nibInstance
        paymentMethodVC.paymentMethodWireframe = self
        paymentMethodVC.paymentMethodInteractor = paymentMethodListInteractor
        paymentMethodVC.title = "Payment Methods"
        
        self.paymentMethodListViewController = paymentMethodVC
        if isRoot {
            self.rootWireframe?.showRootViewController(paymentMethodVC)
        } else {
            self.rootWireframe?.pushViewController(paymentMethodVC)
        }
    }
    
}

