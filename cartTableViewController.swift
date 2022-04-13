//
//  cartTableViewController.swift
//  Pos
//
//  Created by Sixiao He on 2022/3/29.
//
import UIKit

class cartTableViewController:UIViewController {
    @IBOutlet weak var tableview:UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
}

extension cartTableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("xxx::SectionCount +   \(selectedProcuctions.count)")
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("xxx:: cell for rowat")
        guard let item = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as? ItemsCell else {
            return UITableViewCell()
        }
        item.configShow(cartProducts[indexPath.row])
        return item
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return("Shopping Cart")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sum = cartProducts.reduce(0,{$0 + $1.totalAmount})
        let save = cartProducts.reduce(0,{$0 + $1.saveAmount})
        return ("                        Saved: ¥ \(save)    Total amount: ¥ \(sum)    ")
    }
}


