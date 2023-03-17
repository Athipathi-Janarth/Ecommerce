//
//  ProductTypeList.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
class ProductTypeList{
    
    var productTypeList:[ProductType]
    
    init() {
        self.productTypeList = []
    }
    
    func addProductType(producttype:ProductType){
        self.productTypeList.append(producttype)
    }
    func getProductTypeList()-> [ProductType]{
        return self.productTypeList
    }
}
