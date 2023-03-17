//
//  ManageTypeViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/16/23.
//

import UIKit

class ManageTypeViewController: UIViewController {
    var productType:ProductType?
    override func viewDidLoad() {
        super.viewDidLoad()
        let id=productType?.id
        typeID.text="Product Type ID    \(id?.description ?? "Nil")"
        typeName.text=productType?.product_type
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var typeID: UILabel!
    @IBOutlet weak var typeName: UITextField!
    
    @IBAction func onTypeUpdate(_ sender: UIButton) {
        let typename = typeName.text ?? ""
        if typename.isEmpty  {
            alert(_msg: "Name is Required")
        }
        productType?.updateType(product_type: typename)
        typeName.text=""
        alert(_msg: "Type Updated Succesfully")
    }
    @IBAction func onTypeDelete(_ sender: UIButton) {
        if let index = eCommerce.typeDirectory.getProductTypeList().firstIndex(where: {$0.id == productType?.id }) {
            eCommerce.typeDirectory.productTypeList.remove(at: index)
        }
        self.dismiss(animated: true)
    }
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func alert(_msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: _msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
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
