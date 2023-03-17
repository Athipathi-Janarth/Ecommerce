//
//  ProductList.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
class ProductList{
    
    var productList:[Product]
    
    init() {
        self.productList = []
    }
    
    func addProduct(product:Product){
        self.productList.append(product)
    }
    func getProductList()-> [Product]{
        return self.productList
    }
}
