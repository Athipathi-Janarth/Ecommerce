//
//  OrderViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        //eCommerce.orderList.addOrder(order: Order(productTypeID: 1, postID: 1, productID: 1))
        //eCommerce.orderList.addOrder(order: Order(productTypeID: 2, postID: 2, productID: 2))
        super.viewDidLoad()
        displayTable()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayTable()
    }
    func alert(_msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: _msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
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
    func displayTable(){
        removeSubviews()
        for order in  eCommerce.orderList.getOrderList(){
            guard let product = eCommerce.productList.getProductList().first(where: { $0.id == order.productID }),
                      let productType = eCommerce.typeDirectory.getProductTypeList().first(where: { $0.id == order.productTypeID }),
                      let post = eCommerce.productPosts.getProductPostsList().first(where: { $0.id == order.postID })
                else {
                    continue
                }
            let label = UILabel()
            let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(deleteOrder(_:)))
            label.isUserInteractionEnabled = true
            label.tag=order.order_id
            label.addGestureRecognizer(tapGestureRecognizer1)
            label.text = "\(order.order_id)     \(product.name)      \(productType.product_type)     Rating:\(product.productRating)/5      $\(post.price)"
            stackView.addArrangedSubview(label)
//            let cell = Bundle.main.loadNibNamed("CellView", owner: self, options: nil)?.first as! TableViewCell
//            cell.ID?.text = "\(order.order_id)"
//            cell.Name?.text = product.name
//            cell.ProductType?.text = productType.product_type
//            cell.Rating?.text = "Rating: \(product.productRating)/5"
//            cell.Price?.text = "Price: $\(post.price)"
//            cell.OrderDate?.text = "Order Date:\(order.Date)"
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(deleteOrder(_:)))
//            cell.isUserInteractionEnabled = true
//            cell.tag=order.order_id
//            cell.addGestureRecognizer(tapGestureRecognizer)
//            cell.contentView.translatesAutoresizingMaskIntoConstraints = false
//            cell.contentView.heightAnchor.constraint(equalToConstant: 71).isActive = true
//            stackView?.spacing=8
//            print("Adding to Stack")
//            stackView?.addArrangedSubview(cell)
           
            }
    }
    @objc func deleteOrder(_ sender: UITapGestureRecognizer){
        guard let tag = sender.view?.tag else {
                return
            }
        alert(_msg: "Order \(tag) will be deleted")
        if let index = eCommerce.orderList.getOrderList().firstIndex(where: {$0.order_id == tag }) {
            eCommerce.orderList.orderList.remove(at: index)
        }
        displayTable()
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
