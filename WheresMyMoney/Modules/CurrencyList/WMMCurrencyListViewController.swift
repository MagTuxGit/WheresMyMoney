//
//  WMMCurrencyListViewController.swift
//  WheresMyMoney
//
//  Created by Andriy Trubchanin on 4/5/18.
//  Copyright © 2018 Onlinico.Trand. All rights reserved.
//

import UIKit

private let currencyCellIdentifier = "CurrencyCell"

class WMMCurrencyListViewController: UIViewController, NibLoadable {

    var currencyWireframe: WMMCurrencyListWireframe?
    var currencyInteractor: WMMCurrencyListInteractorProtocol?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.alwaysBounceVertical = false

        // register cells
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTouch))
    }
    
    @objc func addButtonDidTouch() {
        //TODO: present currency edit VC
    }
}

extension WMMCurrencyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyInteractor?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        //cell = tableView.dequeueReusableCell(withIdentifier: currencyCellIdentifier, for: indexPath)
        cell = tableView.dequeueReusableCell(withIdentifier: currencyCellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: currencyCellIdentifier)
        }

        cell.textLabel?.text = currencyInteractor?.titleForIndexPath(indexPath)
        cell.detailTextLabel?.text = currencyInteractor?.subtitleForIndexPath(indexPath)
        return cell
    }
    
}

extension WMMCurrencyListViewController: UITableViewDelegate {
    //TODO: edit, delete (check refs), selection
}
