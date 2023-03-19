//
//  self.swift
//  Assignment5
//
//  Created by AthiPathi on 2/23/23.
//

import Foundation
extension String {
    static func readLine() -> String? {
        var input: String?
        while input == nil {
            guard let line = Swift.readLine(strippingNewline: true) else {
                return nil
            }
            input = line
        }
        return input
    }
}
class ECommerceStore {
    var typeDirectory : ProductTypeList
    var productList : ProductList
    var companyList : CompanyList
    var productPosts : ProductPostList
    var orderList : OrderList
    
    init(){
        self.typeDirectory = ProductTypeList()
        self.productList = ProductList()
        self.companyList = CompanyList()
        self.productPosts = ProductPostList()
        self.orderList = OrderList()
    }
   
    func searchByProduct() throws{
        //productList.displayProducts()
        print("Product ID:")
        guard let productIDString = readLine(), !productIDString.isEmpty, let productID = Int(productIDString) else {
            throw InputError.invalidInput("Product ID", "non-empty integer")
        }
        guard let productpost = self.productPosts.getProductPostsList().filter({ $0.productID == productID }).first else {
            print("No Post Found")
            throw InputError.invalidInput("Post", "exists")
        }
        productPosts.displayProductPost(post: productpost)
    }
    func searchByRating() throws{
        //productList.displayProducts()
        print("Rating:")
        print("Product Rating (1-5):")
        guard let ratingString = readLine(), !ratingString.isEmpty, let rating = Int(ratingString), (1...5).contains(rating) else {
            throw InputError.invalidInput("Product Rating", "non-empty integer between 1-5")
        }
        guard let product = self.productList.getProductList().first(where: {$0.productRating == rating }) else{
            print("No Product Found ")
            throw InputError.invalidInput("Product", " exists")
        }
        guard let productpost = self.productPosts.getProductPostsList().filter({ $0.productID == product.id }).first else {
            print("No Post Found")
            throw InputError.invalidInput("Post", "exists")
        }
        productPosts.displayProductPost(post: productpost)
    }
    func searchByCompany() throws{
        print("Company ID:")
        guard let companyIDString = readLine(), !companyIDString.isEmpty, let companyID = Int(companyIDString) else {
            throw InputError.invalidInput("Company ID", "non-empty integer")
        }
        guard let productpost = self.productPosts.getProductPostsList().filter({ $0.companyID == companyID }).first else {
            print("No Post Found")
            throw InputError.invalidInput("Post", "exists")
        }
        productPosts.displayProductPost(post: productpost)
    }
    func searchByPost() throws{
        print("Post ID:")
        guard let postIDString = readLine(), !postIDString.isEmpty, let postID = Int(postIDString) else {
            throw InputError.invalidInput("Company ID", "non-empty integer")
        }
        guard let productpost = self.productPosts.getProductPostsList().filter({ $0.id == postID }).first else {
            print("No Post Found")
            throw InputError.invalidInput("Post", "exists")
        }
        productPosts.displayProductPost(post: productpost)
    }
    func searchByProductType() throws{
        print("Product Type ID:")
        guard let productIDString = readLine(), !productIDString.isEmpty, let productTypeID = Int(productIDString) else {
            throw InputError.invalidInput("Product type ID", "non-empty integer")
        }
        guard let productpost = self.productPosts.getProductPostsList().filter({ $0.productTypeID == productTypeID }).first else {
            print("No Post Found")
            throw InputError.invalidInput("Post", "exists")
        }
        productPosts.displayProductPost(post: productpost)
    }
    
    enum InputError: Error {
        case emptyString(String)
        case invalidInput(String, String)
    }
   
}
