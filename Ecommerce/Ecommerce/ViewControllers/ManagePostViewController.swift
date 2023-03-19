//
//  ManagePostViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class ManagePostViewController: UIViewController {
    var post:Product_Post?

    @IBOutlet weak var postID: UILabel!
    @IBOutlet weak var productID: UITextField!
    @IBOutlet weak var productTypeID: UITextField!
    @IBOutlet weak var companyID: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var postedDate: UITextField!
    @IBOutlet weak var postDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id=post?.id
        postID.text="Post ID    \(id?.description ?? "Nil")"
        let productid=post?.productID
        productID.text=productid?.description
        let typeid=post?.productTypeID
        productTypeID.text = typeid?.description
        let amount = post?.price
        price.text = amount?.description
        let date = post?.postedDate
        postedDate.text = date?.description
        let companyid=post?.companyID
        companyID.text = companyid?.description
        postDescription.text = ""
        // Do any additional setup after loading the view.
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func alert(_ msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func onPostUpdate(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let productId = productID.text ?? ""
        let prices = price.text ?? ""
        let typeId = productTypeID.text ?? ""
        let companyId = companyID.text ?? ""
        let description = postDescription.text ?? ""
        let postDate = postedDate.text ?? ""
        if productId.isEmpty  {
            alert( "Please enter a Product ID")
        }
        guard let productIDs = Int(productId) else {
            alert( "Product ID needs to be a number")
            return
            
        }
        guard let product =  eCommerce.productList.getProductList().first(where: {$0.id == productIDs }) else{
            alert(" Product ID Invalid")
            return
        }
        if typeId.isEmpty  {
            alert("Please enter a Product Type")
            return
        }
        guard let typeID = Int(typeId) else {
            alert(" Product Type ID need to be a number")
            return
        }
        guard let productType =  eCommerce.typeDirectory.getProductTypeList().first(where: {$0.id == typeID }) else{
            alert(" Product Type ID Invalid")
            return
        }
        if prices.isEmpty  {
            alert("Please enter price")
            return
        }
        guard let Price = Float(prices) else {
            alert(" Price need to be a number")
            return
        }
        if postDate.isEmpty  {
            alert( "Please enter a Date")
            return
        }
        guard let date = dateFormatter.date(from: postDate) else {
            alert(" Date is Invalid")
            return
        }
        if companyId.isEmpty  {
            alert("Please enter CompanyID")
            return
        }
        guard let comapnyid = Int(companyId) else {
            alert(" Company ID need to be a number")
            return
        }
        guard let company =  eCommerce.companyList.getCompanyList().first(where: {$0.id == comapnyid }) else{
            alert( " Company ID Invalid")
            return
        }
        
        post?.updatePost(productTypeID: productType.id, companyID: company.id, productID: product.id, postedDate: date, price: Price, description: description)
        postID.text="Post ID"
        productID.text=""
        productTypeID.text = ""
        price.text = ""
        postedDate.text=""
        companyID.text = ""
        postDescription.text = ""
        alert("Post Updated Successfully")
    }
    @IBAction func onPostDelete(_ sender: UIButton) {
        if let index = eCommerce.productPosts.getProductPostsList().firstIndex(where: {$0.id == post?.id }) {
            eCommerce.productPosts.productpostList.remove(at: index)
        }
        postID.text="Post ID"
        productID.text=""
        productTypeID.text = ""
        price.text = ""
        postedDate.text=""
        companyID.text = ""
        postDescription.text = ""
        self.dismiss(animated: true)
    }
    @IBAction func onCreateOrder(_ sender: UIButton) {
        var order=Order(productTypeID: post?.productTypeID  ??  0, postID: post?.id ??  0, productID: post?.productID ??  0)
        eCommerce.orderList.addOrder(order: order)
        alert("Order has been placed. Your Order ID is \(order.order_id)")
    }
    
    @IBOutlet weak var onSearch: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
