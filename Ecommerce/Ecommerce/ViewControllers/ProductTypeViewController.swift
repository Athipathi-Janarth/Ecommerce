//
//  ProductTypeViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/16/23.
//

import UIKit

class ProductTypeViewController: UIViewController {

    override func viewDidLoad() {
        eCommerce.typeDirectory.addProductType(producttype: ProductType(product_type: "Gadgets"))
        eCommerce.typeDirectory.addProductType(producttype: ProductType(product_type: "Clothes"))
        eCommerce.typeDirectory.addProductType(producttype: ProductType(product_type: "Shoes"))
        super.viewDidLoad()
        displayTable()
        // Do any additional setup after loading the view.
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
    @IBOutlet weak var typeName: UITextField!
    @IBAction func AddProduct(_ sender: UIButton) {
        let typename = typeName.text ?? ""
        if typename.isEmpty  {
            alert(_msg: "Name is Required")
        }
        var product = ProductType(product_type:typename)
        eCommerce.typeDirectory.addProductType(producttype: product)
        typeName.text=""
        alert(_msg: "Type Added Succesfully")
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
        for type in  eCommerce.typeDirectory.getProductTypeList(){
            let label = UILabel()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(manageType(_:)))
            label.isUserInteractionEnabled = true
            label.tag=type.id
            label.addGestureRecognizer(tapGestureRecognizer)
            label.text = "\(type.id)     \(type.product_type)"
            stackView.addArrangedSubview(label)
            }
    }
    @objc func manageType(_ sender: UITapGestureRecognizer){
        guard let tag = sender.view?.tag else {
                return
            }
            
        guard let productType = eCommerce.typeDirectory.getProductTypeList().first(where: { $0.id == tag }) else{
            alert(_msg: "Select a Valid Item")
            return
        }
        var manageType = ManageTypeViewController(nibName: "ManageType", bundle:nil) ;
        manageType.productType=productType
        manageType.modalPresentationStyle = .fullScreen
        self.present(manageType, animated: true)
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
