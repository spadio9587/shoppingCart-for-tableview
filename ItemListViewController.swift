//
//  ItemListViewController.swift
//  Pos
//
//  Created by Sixiao He on 2022/3/28.
//

import UIKit


class ItemsViewController:UIViewController,UpdateArrayDelegate,RemoveDelegate{
    
    func updateArray(item: Item?) {
        selectedProcuctions.append(item!)
        itemsTotal.removeAll()
        for item in selectedProcuctions {
            let count = itemsTotal[item.name]
            if let count = count {
                itemsTotal[item.name] = count + 1
            } else {
                itemsTotal[item.name] = 1
            }
        }
        
        cartProducts = itemsTotal.map { (key, value) in
            //in用来区分闭包的参数和函数体
            let price = items.first(where: {$0.name == key})!.price
            let number = (price as NSString).floatValue
            let fixedValue = value - (((item!.barcode == "ITEM000000") || (item!.barcode == "ITEM000001") || (item!.barcode == "ITEM000005")) ? value/3 : 0)
            let savedPrice = (Float(value/3) * number)
            let totalAmount = (number * Float(fixedValue))
            return ShowType(name:key, count:value, price: price, totalAmount: totalAmount,saveAmount: savedPrice)
        }
    }
    
    
    func removeArray(item: Item?) {
        print("let remove")
//        selectedProcuctions.removeLast()
        if let index = selectedProcuctions.firstIndex(where: {$0.name == item?.name}){
            selectedProcuctions.remove(at: index)
        }
        itemsTotal.removeAll()
        // remove items have done 
        for item in selectedProcuctions {
            let count = itemsTotal[item.name]
            if let count = count {
                itemsTotal[item.name] = count + 1
            }else{
                itemsTotal[item.name] = 1
            }
        }
        cartProducts = itemsTotal.map { (key, value) in
            let price = items.first(where: {$0.name == key})!.price
            let number = (price as NSString).floatValue
            let fixedValue = value - ((item!.barcode == "ITEM000000") || (item!.barcode == "ITEM000001") || (item!.barcode == "ITEM000005") ? value/3 : 0)
            let savedPrice = (Float(value/3) * number)
            let totalAmount = (number * Float(fixedValue))
            return ShowType(name:key, count:value, price: price, totalAmount: totalAmount,saveAmount: savedPrice)
        }
    }
    
    //    func remove(item: Item?) {
    //        guard let index = selectedProcuctions.index(where : {$0.name == item!.name}) else {return}
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
    }
}

extension ItemsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as?
                ItemsCell else {
                    return UITableViewCell()
                }
        item.delegate = self
        item.delegate2 = self
        item.configure(with: items[indexPath.row])
        if indexPath.row % 2 == 0
        {
            item.backgroundColor = .gray
        }else{
            item.backgroundColor = .white
        }
        return item
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Items List"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
