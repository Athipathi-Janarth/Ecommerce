//
//  OrderList.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import Foundation
class OrderList{
    
    var orderList:[Order]
    
    init() {
        self.orderList = []
    }
    
    func addOrder(order:Order){
        self.orderList.append(order)
    }
    func getOrderList()-> [Order]{
        return self.orderList
    }
}
