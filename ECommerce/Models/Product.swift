//
//  Product.swift
//  Assignment5
//
//  Created by AthiPathi on 2/22/23.
//

import Foundation
class Product {
    static var lastID: Int = 0
    
    let id: Int
    var name: String
    var productDescription: String?
    var productRating: Int
    var quantity: Int
    var companyID: Int
    
    init(name: String, productDescription: String?, productRating: Int, companyID: Int, quantity: Int) {
        Product.lastID += 1
        self.id = Product.lastID
        self.name = name
        self.productDescription = productDescription
        self.productRating = productRating
        self.companyID = companyID
        self.quantity = quantity
    }
    
}
