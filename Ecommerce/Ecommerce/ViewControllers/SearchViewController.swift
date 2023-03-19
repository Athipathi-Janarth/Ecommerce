//
//  SearchViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
   
    @IBAction func ratingChange(_ sender: Any) {
        let productId = Rating.text ?? ""
        if productId.isEmpty  {
            let dialogMessage = UIAlertController(title: "Alert", message: "Please enter a Rating", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        guard let productIDs = Int(productId) else {
            let dialogMessage = UIAlertController(title: "Alert", message: "Rating need to be a number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        let productList = eCommerce.productList.getProductList().filter {$0.productRating == productIDs }
        var list:[Product_Post]
        list=[]
        for product in productList {
            let productpost = eCommerce.productPosts.getProductPostsList().filter{ $0.productID == product.id }
            list+=productpost
        }
       displayTable(list: list)
    }
    @IBAction func productIDChange(_ sender: Any) {
        let productId = productID.text ?? ""
        if productId.isEmpty  {
            let dialogMessage = UIAlertController(title: "Alert", message: "Please enter a Product ID", preferredStyle: .alert)

               return
           }
            guard let productIDs = Int(productId) else {
            let dialogMessage = UIAlertController(title: "Alert", message: "Product ID to be a number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })

             dialogMessage.addAction(ok)
              self.present(dialogMessage, animated: true, completion: nil)
               return
        }
         let productpost = eCommerce.productPosts.getProductPostsList().filter{ $0.id == productIDs }
        displayTable(list: productpost)
    }
    @IBAction func typeIDChange(_ sender: Any) {
        let productId = typeID.text ?? ""
        if productId.isEmpty  {
            let dialogMessage = UIAlertController(title: "Alert", message: "Please enter a Product Type ID", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        guard let productIDs = Int(productId) else {
            let dialogMessage = UIAlertController(title: "Alert", message: "ProductType ID to be a number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        let productpost = eCommerce.productPosts.getProductPostsList().filter{ $0.productTypeID == productIDs }
       displayTable(list: productpost)
    }
    @IBAction func postIDChange(_ sender: Any) {
        let productId = postID.text ?? ""
        if productId.isEmpty  {
            let dialogMessage = UIAlertController(title: "Alert", message: "Please enter a Post ID", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })
             
             dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
               return
           }
            guard let productIDs = Int(productId) else {
            let dialogMessage = UIAlertController(title: "Alert", message: "Product ID to be a number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })
             
             dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
               return
        }
         let productpost = eCommerce.productPosts.getProductPostsList().filter{ $0.id == productIDs }
        displayTable(list: productpost)
    }
    @IBAction func companyIDChange(_ sender: Any) {
        let productId = companyID.text ?? ""
        if productId.isEmpty  {
            let dialogMessage = UIAlertController(title: "Alert", message: "Please enter a Company ID", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        guard let productIDs = Int(productId) else {
            let dialogMessage = UIAlertController(title: "Alert", message: "Compay ID to be a number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
            })
            
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            return
        }
        let productpost = eCommerce.productPosts.getProductPostsList().filter{ $0.companyID == productIDs }
        displayTable(list: productpost)
    }
    
    @IBOutlet weak var typeID: UITextField!
    @IBOutlet weak var productID: UITextField!
    @IBOutlet weak var companyID: UITextField!

    @IBOutlet weak var postID: UITextField!
    @IBOutlet weak var Rating: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    func removeSubviews() {
        guard let stackView = stackView else {
               return
           }

           for subview in stackView.subviews {
               stackView.removeArrangedSubview(subview)
               subview.removeFromSuperview()
           }
        }
    func displayTable(list: [Product_Post]){
        removeSubviews()
        for post in  list{
            guard let company =  eCommerce.companyList.getCompanyList().first(where: {$0.id == post.companyID }) else{
                print("No Data")
                return
            }
            guard let product =  eCommerce.productList.getProductList().first(where: {$0.id == post.productID }) else{
                print("No Data")
                return
            }
            guard let type =  eCommerce.typeDirectory.getProductTypeList().first(where: {$0.id == post.productTypeID }) else{
                print("No Data")
                return
            }
            let label = UILabel()
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewPost(_:)))
//            label.isUserInteractionEnabled = true
//            label.tag=post.id
//            label.addGestureRecognizer(tapGestureRecognizer)
            label.text = "\(post.id)     \(product.name)     \(type.product_type)     \(company.name)    $\(post.price)"
            stackView.addArrangedSubview(label)
            }
        if(list.isEmpty){
            let dialogMessage = UIAlertController(title: "Alert", message: "No Post Found", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })

             dialogMessage.addAction(ok)
              self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
