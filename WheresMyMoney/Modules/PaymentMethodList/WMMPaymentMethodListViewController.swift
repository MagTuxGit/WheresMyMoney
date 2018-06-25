//
//  WMMPaymentMethodListViewController.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

private let paymentMethodCellIdentifier = "PaymentMethodCell"

class WMMPaymentMethodListViewController: UIViewController, NibLoadable {

    var paymentMethodWireframe: WMMPaymentMethodListWireframe?
    var paymentMethodInteractor: WMMPaymentMethodListInteractorProtocol?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.alwaysBounceVertical = false
        
        // register cells
    }
}

extension WMMPaymentMethodListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentMethodInteractor?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        //cell = tableView.dequeueReusableCell(withIdentifier: paymentMethodCellIdentifier, for: indexPath)
        cell = tableView.dequeueReusableCell(withIdentifier: paymentMethodCellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: paymentMethodCellIdentifier)
        }
        
        cell.textLabel?.text = paymentMethodInteractor?.titleForIndexPath(indexPath)
        cell.detailTextLabel?.text = paymentMethodInteractor?.subtitleForIndexPath(indexPath)
        return cell
    }
    
}
