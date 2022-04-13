//
//  items.swift
//  Pos
//
//  Created by Sixiao He on 2022/3/28.
//

import Foundation

var selectedProcuctions : [Item] = []
var itemsTotal: [String: Int] = [:]
//数组的数据格式为 [物品名称：物品数量]
var cartProducts: [ShowType] = []
struct Item {
    let barcode : String
    let name: String
    let unit: String
    let price: String
    
}
struct ShowType {
    let name: String
    let count: Int
    let price: String
    let totalAmount : Float
    let saveAmount : Float
}   
let items = [
    Item(barcode: "ITEM000000", name: "可口可乐", unit: "瓶", price: "3.00"),
    Item(barcode: "ITEM000001", name: "雪碧", unit: "瓶", price: "3.00"),
    Item(barcode: "ITEM000002", name: "苹果", unit: "斤", price: "5.50"),
    Item(barcode: "ITEM000003", name: "荔枝", unit: "斤", price: "15.00"),
    Item(barcode: "ITEM000004", name: "电池", unit: "个", price: "2.00"),
    Item(barcode: "ITEM000005", name: "方便面", unit: "袋", price: "4.50")
]

struct Promotion{
    let promotionItems : String
}

let promotion = [
Promotion(promotionItems: "ITEM000000"),
Promotion(promotionItems: "ITEM000001"),
Promotion(promotionItems: "ITEM000005")]

//数组
//map [key:value]
//!!!!



