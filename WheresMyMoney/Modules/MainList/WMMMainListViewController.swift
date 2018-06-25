//
//  WMMMainListViewController.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 6/25/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

private let mainListCellIdentifier = "MainListCell"

class WMMMainListViewController: UIViewController, NibLoadable {

    var mainListWireframe: WMMMainListWireframe?
    var mainListInteractor: WMMMainListInteractorProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.alwaysBounceVertical = false
        
        // register cells
    }
}

extension WMMMainListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainListInteractor?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        //cell = tableView.dequeueReusableCell(withIdentifier: mainListCellIdentifier, for: indexPath)
        cell = tableView.dequeueReusableCell(withIdentifier: mainListCellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: mainListCellIdentifier)
        }
        
        cell.textLabel?.text = mainListInteractor?.titleForIndexPath(indexPath)
        return cell
    }
}

extension WMMMainListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellValue = mainListInteractor?.titleForIndexPath(indexPath) else { return }
        
        //TODO: replace with enum
        switch cellValue {
        case "Currencies":
            mainListWireframe?.presentCurrencyScreen()
        case "Payment Methods":
            mainListWireframe?.presentPaymentMethodScreen()
        default:
            return
        }
    }
}
