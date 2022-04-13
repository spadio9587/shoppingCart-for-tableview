//
//  ItemsCell.swift
//  Pos
//
//  Created by Sixiao He on 2022/3/28.
//

import UIKit

protocol UpdateArrayDelegate {
    func updateArray(item:Item?)
}

protocol RemoveDelegate {
    // 首字母大写
    func removeArray(item:Item?)
}
//代码格式化（快捷键，插件）
class ItemsCell: UITableViewCell {
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var saveAmount: UILabel!
    @IBOutlet weak var click: UIButton!
    var item: Item?
    var delegate: UpdateArrayDelegate?
    var delegate2: RemoveDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        //click.layer.cornerRadius = 5
        //click.clipsToBounds = true
        // ??? 为什么会出现optional的value
    }
    func setButton(state:Bool) {
        click.isSelected = state
        //click.backgroundColor = (click.isSelected) ? .gray : .white
    }
    
    @IBAction func removeCart(_ sender: Any) {
        setButton(state:!click.isSelected)
        delegate2?.removeArray(item: self.item)
        click.isEnabled = cartProducts.map({$0.name == item?.name}).count > 0
        click.backgroundColor = click.isEnabled ? nil : .white
        print("remove cart")
    }

    @IBAction func clickAddButton(_ sender: UIButton!){
        delegate?.updateArray(item: self.item)
    }
    //传进来的item需要传出去
    func configure(with item: Item) {
        self.item = item
        barcodeLabel.text = item.barcode
        nameLabel.text = item.name
        unitLabel.text = item.unit
        priceLabel.text = item.price
        
    }
    func configShow(_ showItem: ShowType) {
        nameLabel.text = showItem.name
        priceLabel.text = ("Price:¥") + showItem.price
        unitLabel.text = ("Count:") + String(describing: showItem.count)
        totalAmount.text = "Subtotal:¥" + String(describing: showItem.totalAmount)
        saveAmount.text = ""
    }
}
