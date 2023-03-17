//
//  PostList.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
class ProductPostList{
    
    var productpostList:[Product_Post]
    
    init() {
        self.productpostList = []
    }
    
    func addProductPost(product_post:Product_Post){
        self.productpostList.append(product_post)
    }
    func getProductPostsList()-> [Product_Post]{
        return self.productpostList
    }
    func addProductPost() throws {
        print("Enter post details:")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print("Product Type ID:")
        guard let producttypeString = readLine(), !producttypeString.isEmpty, let productType = Int(producttypeString) else {
            throw InputError.invalidInput("Quantity", "non-empty integer")
        }
        guard let product_type = eCommerce.typeDirectory.getProductTypeList().first(where: {$0.id == productType }) else{
            print("Product Type invalid ")
            throw InputError.invalidInput("Product Type", " exists")
        }
        print("Product ID:")
        guard let productIDString = readLine(), !productIDString.isEmpty, let productID = Int(productIDString) else {
            throw InputError.invalidInput("Product ID", "non-empty integer")
        }
        guard let product = eCommerce.productList.getProductList().first(where: {$0.id == productID }) else{
            print("Product ID invalid ")
            throw InputError.invalidInput("Product", " exists")
        }
        let companyID = product.companyID
        print("Price:")
        guard let priceString = readLine(), !priceString.isEmpty, let price = Float(priceString) else {
            throw InputError.invalidInput("Quantity", "non-empty integer")
        }
        print("Posted Date (yyyy-MM-dd):")
        guard let dateString = readLine(), !dateString.isEmpty, let date = dateFormatter.date(from: dateString) else {
            throw InputError.invalidInput("Posted date", "non-empty date string in the format yyyy-MM-dd")
        }
        print("Description:")
        let productDescription = readLine()
        
        let productpost=Product_Post(productTypeID: productType, companyID: companyID, productID: productID, postedDate: date, price: price, description: productDescription)
        addProductPost(product_post: productpost)
    }
    enum InputError: Error {
        case emptyString(String)
        case invalidInput(String, String)
    }
    func displayProductPost(){
        print("ID","Type ID","Product ID","Company ID","Posted Date","Price","Description", separator: "\t")
        for post in getProductPostsList(){
            let description = post.description?.description
            print(post.id,post.productTypeID,post.productID,post.companyID,post.postedDate,post.price,description ?? "No Value", separator: "\t\t")
        }
    }
    func displayProductPost(post:Product_Post){
        print("ID","Type ID","Product ID","Company ID","Posted Date","Price","Description", separator: "\t")
       
            let description = post.description?.description
            print(post.id,post.productTypeID,post.productID,post.companyID,post.postedDate,post.price,description ?? "No Value", separator: "\t\t")
        
    }
    func deleteProductPost() throws{
        print("Product Post ID:")
        guard let productIDString = readLine(), !productIDString.isEmpty, let productpostID = Int(productIDString) else {
            throw IntError.invalidInput("Product Post ID", "non-empty integer")
        }
        if let index = productpostList.firstIndex(where: {$0.id == productpostID }) {
            productpostList.remove(at: index)
        }
    }
    enum IntError: Error {
        case invalidInput(String, String)
    }
    func updateProductPost() throws {
        displayProductPost()
        print("Enter Product Post ID:")
        guard let producttypeString = readLine(), !producttypeString.isEmpty, let productpostID = Int(producttypeString) else {
            throw InputError.invalidInput("Quantity", "non-empty integer")
        }
        if let productPost = productpostList.first(where: {$0.id == productpostID }) {
            print("Enter Details:")
            print("Price:")
            guard let priceString = readLine(), !priceString.isEmpty, let price = Float(priceString) else {
                throw InputError.invalidInput("Quantity", "non-empty integer")
            }
            print("Description:")
            let productDescription = readLine()
            productPost.updatePost(price: price, description: productDescription)
        }
    }
  
}
