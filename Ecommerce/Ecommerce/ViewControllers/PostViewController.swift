//
//  PostViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class PostViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    override func viewDidLoad() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        eCommerce.productPosts.addProductPost(product_post: Product_Post(productTypeID: 1, companyID: 2, productID: 1, postedDate: dateFormatter.date(from:"2022-03-01") ?? Date(), price: 500.00, description: ""))
//        eCommerce.productPosts.addProductPost(product_post: Product_Post(productTypeID: 1, companyID: 1, productID: 2, postedDate: dateFormatter.date(from:"2022-01-01") ?? Date(), price: 1000.00, description: ""))
//        eCommerce.productPosts.addProductPost(product_post: Product_Post(productTypeID: 2, companyID: 3, productID: 3, postedDate: dateFormatter.date(from:"2022-01-01") ?? Date(), price: 300.00, description: ""))
//        eCommerce.productPosts.addProductPost(product_post: Product_Post(productTypeID: 3, companyID: 3, productID: 4, postedDate: dateFormatter.date(from:"2022-01-01") ?? Date(), price: 250.00, description: ""))
        super.viewDidLoad()
        displayTable()


        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var productID: UITextField!
    @IBOutlet weak var productTypeID: UITextField!
    @IBOutlet weak var companyID: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var postedDate: UITextField!
    @IBOutlet weak var postDescription: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    func alert(_ msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    @IBAction func onSearch(_ sender: Any) {
        var search = SearchViewController(nibName: "SearchView", bundle: nil)
        search.modalPresentationStyle = .fullScreen
        self.present(search, animated: true)
    }
    @IBAction func createPost(_ sender: UIButton) {
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
        guard let product = try? context.fetch(Product.fetchRequest()).first(where: {$0.id == productIDs }) else{
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
        guard let productType =  try? context.fetch(ProductType.fetchRequest()).first(where: {$0.id == typeID }) else{
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
        guard let company =  try? context.fetch(Company.fetchRequest()).first(where: {$0.id == comapnyid }) else{
            alert( " Company ID Invalid")
            return
        }
        
        var post=Product_Post(context: self.context)
        post.id=Int64(AppDelegate.postId)
        post.productTypeID = productType.id
        post.companyID = company.id
        post.productID = product.id
        post.postedDate = date
        post.price = Price
        post.postDescription = description
        try? context.save()
        AppDelegate.postId+=1
        productID.text=""
        productTypeID.text = ""
        price.text = ""
        postedDate.text=""
        companyID.text = ""
        postDescription.text = ""
        alert("Post Created Successfully")
        displayTable()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayTable()
    }
    func removeSubviews() {
        guard let stackView = stackView else {
               return
           }
           
           for subview in stackView.subviews {
               stackView.removeArrangedSubview(subview)
               subview.removeFromSuperview()
           }
        }
    func displayTable(){
        removeSubviews()
        do{
            for post in  try context.fetch(Product_Post.fetchRequest()){
                guard let company = try? context.fetch(Company.fetchRequest()).first(where: {$0.id == post.companyID }) else{
                    print("No Data")
                    continue
                }
                guard let product =  try? context.fetch(Product.fetchRequest()).first(where: {$0.id == post.productID }) else{
                    print("No Data")
                    continue
                }
                guard let type =  try? context.fetch(ProductType.fetchRequest()).first(where: {$0.id == post.productTypeID }) else{
                    print("No Data")
                    continue
                }
                let label = UILabel()
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewPost(_:)))
                label.isUserInteractionEnabled = true
                label.tag=Int(post.id)
                label.addGestureRecognizer(tapGestureRecognizer)
                label.text = "\(post.id)     \(product.name!)     \(type.product_Type!)     \(company.name!)    $\(post.price)"
                stackView.addArrangedSubview(label)
            }
        }
        catch{
            alert("NO POST FOUND")
        }
    }
    @objc func viewPost(_ sender: UITapGestureRecognizer){
        guard let tag = sender.view?.tag else {
                return
            }
            
        guard let post = try? context.fetch(Product_Post.fetchRequest()).first(where: { $0.id == tag }) else{
            alert( "Select a Valid Item")
            return
        }
        var managePost = ManagePostViewController(nibName: "ManagePostView", bundle:nil) ;
        managePost.post=post
        managePost.modalPresentationStyle = .fullScreen
        self.present(managePost, animated: true)
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
