//
//  ProductViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class ProductViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    override func viewDidLoad() {
//        eCommerce.productList.addProduct(product: Product(name: "iPhone", productDescription: "14 series", productRating: 5, companyID: 2, quantity: 50))
//        eCommerce.productList.addProduct(product: Product(name: "Camera", productDescription: "" , productRating: 4, companyID: 1, quantity: 10))
//        eCommerce.productList.addProduct(product: Product(name: "Jacket", productDescription: "", productRating: 5, companyID: 3, quantity: 70))
//        eCommerce.productList.addProduct(product: Product(name: "Sneaker", productDescription: "", productRating: 3, companyID: 3, quantity: 20))
        super.viewDidLoad()
        displayTable()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var companyID: UITextField!
    @IBOutlet weak var Rating: UITextField!
    @IBOutlet weak var Quantity: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    func alert(_msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: _msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    @IBAction func createProduct(_ sender: UIButton) {
        let productname = productName.text ?? ""
        let productRating = Rating.text ?? ""
        let productQuantity = Quantity.text ?? ""
        let companyId = companyID.text ?? ""
        let productDescriptions = productDescription.text ?? ""
        if productname.isEmpty  {
           alert(_msg: "Please enter a Product Name")
           }
        if productRating.isEmpty  {
            alert(_msg: "Please enter a Rating")
           }
        guard let rating = Int(productRating) else {
            alert(_msg: "Rating Need to be a number")
            return
    }
        if companyId.isEmpty  {
            alert(_msg: "Please enter a Company ID")
           }
        guard let companyid = Int(companyId) else {
            alert(_msg: "companyID Need to be a number")
            return
    }
        guard let company =  try? context.fetch(Company.fetchRequest()).first(where: {$0.id == companyid }) else{
            alert(_msg: "company ID doesn't exists")
            return
        }
        if productQuantity.isEmpty  {
            alert(_msg: "Please enter the Quantity")
           }
            guard let quantity = Int(productQuantity) else {
                alert(_msg: "Quantity Need to be a number")
                return
        }
        var product=Product(context: self.context)
        product.id=Int64(AppDelegate.productId)
        product.name = productname
        product.productDescription = productDescriptions
        product.productRating = Int64(rating)
        product.companyID = Int64(companyid)
        product.quantity = Int64(quantity)
        try? context.save()
        AppDelegate.productId+=1
        alert(_msg: "Product Added Successfully")
        productName.text=""
        Rating.text = ""
        Quantity.text = ""
        productDescription.text = ""
        companyID.text = ""
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
            for product in  try context.fetch(Product.fetchRequest()){
                guard let company =  try? context.fetch(Company.fetchRequest()).first(where: {$0.id == product.companyID }) else{
                    print("No Data")
                    continue
                }
                let label = UILabel()
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewProduct(_:)))
                label.isUserInteractionEnabled = true
                label.tag=Int(product.id)
                label.addGestureRecognizer(tapGestureRecognizer)
                label.text = "\(product.id)     \(product.name!)      \(company.name!)"
                stackView.addArrangedSubview(label)
            }
        }
        catch{
            alert(_msg: "No Product Found")
        }
    }
    @objc func viewProduct(_ sender: UITapGestureRecognizer){
        guard let tag = sender.view?.tag else {
                return
            }
            
        guard let product = try? context.fetch(Product.fetchRequest()).first(where: { $0.id == tag }) else{
            alert(_msg: "Select a Valid Item")
            return
        }
        var manageProduct = ManageProductViewController(nibName: "ManageProductView", bundle:nil) ;
        manageProduct.product=product
        manageProduct.modalPresentationStyle = .fullScreen
        self.present(manageProduct, animated: true)
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
