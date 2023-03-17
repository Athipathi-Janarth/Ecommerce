//
//  ProductType.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
class ProductType {
    static var lastID: Int = 0
    
    let id: Int
    var product_type: String
    
    init(product_type: String) {
        ProductType.lastID += 1
        self.id = ProductType.lastID
        self.product_type = product_type
    }
    func updateType(product_type: String) {
        self.product_type = product_type
    }
}
