//
//  ProductPost.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
class Product_Post {
    static var lastID: Int = 0
    
    let id: Int
    var productTypeID: Int
    var companyID: Int
    var productID: Int
    var postedDate: Date
    var price: Float
    var description: String?
    
    init(){
        self.id = 0
        self.productTypeID = 0
        self.companyID = 0
        self.productID = 0
        self.postedDate = Date()
        self.price = 0
        self.description = ""
    }
    init(productTypeID: Int, companyID: Int, productID: Int, postedDate: Date, price :Float,description:String? ) {
        Product_Post.lastID += 1
        self.id = Product_Post.lastID
        self.productTypeID = productTypeID
        self.companyID = companyID
        self.productID = productID
        self.postedDate = postedDate
        self.price = price
        self.description = description
    }
    func updatePost(productTypeID: Int, companyID: Int, productID: Int, postedDate: Date, price :Float,description:String? ) {
        self.productTypeID = productTypeID
        self.companyID = companyID
        self.productID = productID
        self.postedDate = postedDate
        self.price = price
        self.description = description
    }
}
